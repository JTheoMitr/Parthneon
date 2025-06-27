extends Node2D

@onready var vbox = $VBoxContainer
@onready var button = $VBoxContainer/Button
@onready var city3 = $City3
@onready var city4 = $City4
@onready var city5 = $City5
@onready var theme = $Theme
@onready var nightSky = $NightSky
@onready var nightSky2 = $NightSky2


var levelOne = preload("res://level.tscn")
var scrolling = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.grab_focus()
	$Theme.play(0.0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
		
		


func _on_timer_timeout() -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(0, 676325736)
	var stylebox_theme: StyleBoxFlat = button.get_theme_stylebox("normal")
	stylebox_theme.bg_color = Color.hex(num)
	button.add_theme_stylebox_override("normal", stylebox_theme)


func _on_timer_2_timeout() -> void:
	city4.global_position.x -= 1


func _on_timer_3_timeout() -> void:
	city5.global_position.x -= 2


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
	


func _on_theme_finished() -> void:
	theme.play(0.0)
