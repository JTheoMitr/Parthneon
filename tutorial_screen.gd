extends Node2D

@onready var button = $HBoxContainer/Next
@onready var city3 = $City3
@onready var city4 = $City4
@onready var city5 = $City5
@onready var theme = $Theme
@onready var nightSky = $NightSky
@onready var nightSky2 = $NightSky2
@onready var tut1 = $Panel2
@onready var tut2 = $Panel3
@onready var tut3 = $Panel4
@onready var tut4 = $Panel8
@onready var tut5 = $Panel5
@onready var tut6 = $Panel6
@onready var tut7 = $Panel7
@onready var exitBtn = $TextureButton
@onready var backButton = $HBoxContainer/Back


var levelOne = preload("res://level.tscn")
var scrolling = false
var tutCount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.grab_focus()
	$Theme.play(0.0)
	tutCount = 0
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if (backButton.has_focus() || button.has_focus()):
		if Input.is_action_just_pressed("ui_cancel"):
			exitBtn.grab_focus()
			
	if exitBtn.has_focus():
		if Input.is_action_just_pressed("ui_right"):
			backButton.grab_focus()
			
	
	match tutCount:
		0:
			tut1.show()
			tut2.hide()
			tut3.hide()
			tut4.hide()
			tut5.hide()
			tut6.hide()
			tut7.hide()
		1:
			tut1.hide()
			tut2.show()
			tut3.hide()
			tut4.hide()
			tut5.hide()
			tut6.hide()
			tut7.hide()
		2:
			tut1.hide()
			tut2.hide()
			tut3.show()
			tut4.hide()
			tut5.hide()
			tut6.hide()
			tut7.hide()
		3:
			tut1.hide()
			tut2.hide()
			tut3.hide()
			tut4.show()
			tut5.hide()
			tut6.hide()
			tut7.hide()
		4:
			tut1.hide()
			tut2.hide()
			tut3.hide()
			tut4.hide()
			tut5.show()
			tut6.hide()
			tut7.hide()
		5:
			tut1.hide()
			tut2.hide()
			tut3.hide()
			tut4.hide()
			tut5.hide()
			tut6.show()
			tut7.hide()
		6:
			tut1.hide()
			tut2.hide()
			tut3.hide()
			tut4.hide()
			tut5.hide()
			tut6.hide()
			tut7.show()
		
		


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
	


func _on_theme_finished() -> void:
	theme.play(0.0)


func _on_next_pressed() -> void:
	if tutCount < 6:
		tutCount += 1


func _on_back_pressed() -> void:
	if tutCount > 0:
		tutCount -= 1


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
