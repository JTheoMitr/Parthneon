extends Control

var characters = []
var slots = [0, 0, 0] # indexes into characters array
var current_slot = 0
var leaderboard = Leaderboard
# Input repeat control
var hold_dir = 0 # -1 = down, 1 = up, 0 = none
var hold_time = 0.0
var stats = PlayerStats
const HOLD_DELAY = 0.3
const HOLD_RATE = 0.08

signal initials_entered(initials: String)

@onready var labels = [
	$HBoxContainer/Slot0,
	$HBoxContainer/Slot1,
	$HBoxContainer/Slot2
]
@onready var submitBtn = $Button

func _ready():
	characters.append_array(["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"])
	characters.append_array(["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"])
	characters.append_array(["0","1","2","3","4","5","6","7","8","9","?","$","!"])
	_update_labels()

func _input(event):
	if event.is_action_pressed("ui_left"):
		current_slot = max(0, current_slot - 1)
		_update_labels()
	elif event.is_action_pressed("ui_right"):
		current_slot = min(2, current_slot + 1)
		_update_labels()
	elif event.is_action_pressed("ui_up"):
		_adjust_slot(1)
		hold_dir = 1
		hold_time = 0
	elif event.is_action_pressed("ui_down"):
		_adjust_slot(-1)
		hold_dir = -1
		hold_time = 0
	elif event.is_action_released("ui_up") and hold_dir == 1:
		hold_dir = 0
	elif event.is_action_released("ui_down") and hold_dir == -1:
		hold_dir = 0
	elif event.is_action_pressed("ui_accept"):
		submitBtn.grab_focus()


func _process(delta):
	if hold_dir != 0:
		hold_time += delta
		if hold_time > HOLD_DELAY:
			# compute how many steps to take
			var steps = int((hold_time - HOLD_DELAY) / HOLD_RATE)
			if steps > 0:
				_adjust_slot(hold_dir)
				hold_time -= steps * HOLD_RATE

func _adjust_slot(dir):
	slots[current_slot] = (slots[current_slot] + dir + characters.size()) % characters.size()
	_update_labels()



func _update_labels():
	for i in range(3):
		labels[i].text = characters[slots[i]]
		labels[i].add_theme_color_override(
			"font_color",
			Color(1, 1, 0) if i == current_slot else Color(1, 1, 1)
)


func _on_button_pressed() -> void:
	var initials = ""
	for i in slots:
		initials += characters[i]
	print("Player Initials: ", initials)
	emit_signal("initials_entered", initials)
	
	leaderboard.submit_score("parthneon_leaderboard_local", stats.runScore, initials)
	
