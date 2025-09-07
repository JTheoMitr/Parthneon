extends Node

var Nakama = preload("res://addons/com.heroiclabs.nakama/nakama.gd")

signal scores_fetched(records)
signal score_submitted

var client
var session
var adapter

# 🔹 Change this device_id to control which Nakama user you’re authenticating as.
#    Use the same value in Postman if you want to test against the same account.
const DEVICE_ID := "local_device_001"
const USERNAME  := "username1" # Optional: just a display name

func _ready():
	# 1. Create adapter
	adapter = NakamaHTTPAdapter.new()
	add_child(adapter)

	# 2. Create client with 6 args
	client = NakamaClient.new(
		adapter,          # NakamaHTTPAdapter
		"defaultkey",     # server key
		"http",           # scheme
		"127.0.0.1",      # host
		7350,             # port
		30                # timeout (seconds)
	)

	# Authenticate device session (or restore)
	await get_tree().process_frame
	await authenticate_device(DEVICE_ID)


# 🔹 Device authentication
func authenticate_device(device_id: String) -> void:
	var new_session = await client.authenticate_device_async(device_id, USERNAME, true)
	if new_session.is_exception():
		push_error("Auth failed: %s" % new_session)
		return
	session = new_session
	print("Authenticated with Nakama: user_id=%s" % session.user_id)
	print("Token: %s" % session.token)


# 🔹 Helper to check/refresh the session before making any requests
func ensure_session_valid() -> bool:
	if session == null:
		push_error("No session! Call authenticate_device first.")
		return false
	
	# If token is expired, refresh it
	if session.is_expired():
		print_debug("Session expired, refreshing...")
		var refresh_result = await client.session_refresh_async(session)
		if refresh_result.is_exception():
			push_error("Error refreshing session: %s" % refresh_result)
			return false
		session = refresh_result
		print_debug("Session refreshed successfully.")
	
	return true


# 🔹 Submit score with initials in metadata
func submit_score(leaderboard_id: String, score: int, initials: String) -> void:
	if not await ensure_session_valid():
		return

	var metadata = {"initials": initials}
	var result = await client.write_leaderboard_record_async(
		session,
		leaderboard_id,
		score,
		0, # subscore, optional
		JSON.stringify(metadata)
	)

	if result.is_exception():
		push_error("Error submitting score: %s" % result)
		return
	
	print_debug("Score submitted for %s: %d" % [initials, score])
	print_debug("Raw fetch result: %s" % str(result))
	emit_signal("score_submitted")


# 🔹 Fetch and parse top scores for UI
func get_top_scores(leaderboard_id: String, limit: int = 10) -> void:
	if not await ensure_session_valid():
		return

	# Only pass the required args: session + leaderboard_id
	var result = await client.list_leaderboard_records_async(session, leaderboard_id)

	if result.is_exception():
		push_error("Error fetching scores: %s" % result)
		return

	print_debug("Fetched leaderboard '%s' -> %d records" % [leaderboard_id, result.records.size()])
	emit_signal("scores_fetched", result.records)

	for record in result.records:
		print_debug("Record -> user: %s, score: %s, username: %s" %
	[record.owner_id, str(record.score), record.username])
