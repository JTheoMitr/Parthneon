extends Control   # ✅ UI should be a Control, not Node2D

@onready var scoreContainer = $ScoreScroll/ScoreContainer

func _ready() -> void:
	# Connect to manager’s signal for scores
	Leaderboard.connect("scores_fetched", Callable(self, "_on_scores_fetched"))
	Leaderboard.connect("score_submitted", Callable(self, "_on_score_submitted"))
	Leaderboard.get_top_scores("parthneon_leaderboard_local", 10)
	# Ask the manager for the latest scores
	#Leaderboard.get_top_scores("parthneon_leaderboard_local", 10)


func _on_score_submitted() -> void:
	print_debug("Score submitted, now fetching scores")
	Leaderboard.get_top_scores("parthneon_leaderboard_local", 10)
	
# Called when LeaderboardManager finishes fetching scores
func _on_scores_fetched(records: Array) -> void:
	# Clear old rows
	for child in scoreContainer.get_children():
		child.queue_free()
	print_debug("on scores fetched has been called")
	print_debug("on scores fetched has been called, records count: %d" % records.size())

	var rank = 1
	for record in records:
		var initials = record.username  # fallback
		if record.metadata != "":
			var meta = JSON.parse_string(record.metadata)
			if meta and meta.has("initials"):
				initials = meta["initials"]
	
		# Create a row
		var row = preload("res://ui/ScoreRow.tscn").instantiate()
		row.get_node("HBoxContainer/RankLabel").text = str(rank)
		row.get_node("HBoxContainer/NameLabel").text = initials
		row.get_node("HBoxContainer/ScoreLabel").text = str(record.score)
		scoreContainer.add_child(row)
		print_debug("row created")
		rank += 1


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
