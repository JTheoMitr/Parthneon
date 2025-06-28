extends Node2D

@onready var vbox = $VBoxContainer
@onready var button = $VBoxContainer/Button
@onready var city3 = $City3
@onready var city4 = $City4
@onready var city5 = $City5
@onready var theme = $Theme
@onready var nightSky = $NightSky
@onready var nightSky2 = $NightSky2
@onready var hbox = $HBoxContainer
@onready var level1Btn = $HBoxContainer/Button1
@onready var level2Btn = $HBoxContainer/Button2
@onready var level3Btn = $HBoxContainer/Button3
@onready var level4Btn = $HBoxContainer/Button4
@onready var panel1 = $HBoxContainer/Button1/Panel
@onready var panel2 = $HBoxContainer/Button2/Panel
@onready var panel3 = $HBoxContainer/Button3/Panel
@onready var panel4 = $HBoxContainer/Button4/Panel
@onready var exitButton = $TextureButton

var levelOne = preload("res://level.tscn")
var scrolling = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	$Welcome.play(0.0)
	$Theme.play(0.0)
	button.grab_focus()
	$NightSky.play()
	$NightSky2.play()
	vbox.show()
	hbox.hide()
	exitButton.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if scrolling:
		city3.global_position.y += 5.6
		city4.global_position.y += 5.6
		city5.global_position.y += 5.6
		nightSky.global_position.y += 5.6
		nightSky2.global_position.y += 5.6
		$Prism.global_position.y += 5.6
		$RichTextLabel.hide()
		$VBoxContainer.hide()
		
	if hbox.is_visible_in_tree():
		if Input.is_action_just_pressed("ui_down"):
			exitButton.grab_focus()
		if Input.is_action_just_pressed("ui_up"):
			level1Btn.grab_focus()
		
		


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
	hbox.show()
	exitButton.show()
	level1Btn.grab_focus()
	vbox.hide()
	


func _on_theme_finished() -> void:
	theme.play(0.0)


func _on_scroll_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://level.tscn")


func _on_button_1_pressed() -> void:
	scrolling = true
	$ScrollTimer.start()
	hbox.hide()


func _on_button_1_focus_entered() -> void:
	level1Btn.self_modulate.a = 1.0
	level2Btn.self_modulate.a = 0.7
	level3Btn.self_modulate.a = 0.7
	level4Btn.self_modulate.a = 0.7
	panel1.show()
	panel2.hide()
	panel3.hide()
	panel4.hide()


func _on_button_1_focus_exited() -> void:
	level1Btn.self_modulate.a = 0.7
	panel1.hide()


func _on_button_2_pressed() -> void:
	pass # Replace with function body.


func _on_button_2_focus_entered() -> void:
	level2Btn.self_modulate.a = 1.0
	panel2.show()


func _on_button_2_focus_exited() -> void:
	level2Btn.self_modulate.a = 0.7
	panel2.hide()


func _on_button_3_pressed() -> void:
	pass # Replace with function body.


func _on_button_3_focus_entered() -> void:
	level3Btn.self_modulate.a = 1.0
	panel3.show()


func _on_button_3_focus_exited() -> void:
	level3Btn.self_modulate.a = 0.7
	panel3.hide()


func _on_button_4_pressed() -> void:
	pass # Replace with function body.


func _on_button_4_focus_entered() -> void:
	level4Btn.self_modulate.a = 1.0
	panel4.show()


func _on_button_4_focus_exited() -> void:
	level4Btn.self_modulate.a = 0.7
	panel4.hide()


func _on_controls_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ControlsScreen.tscn")


func _on_texture_button_pressed() -> void:
	hbox.hide()
	button.grab_focus()
	vbox.show()
	exitButton.hide()


func _on_tutorials_pressed() -> void:
	get_tree().change_scene_to_file("res://TutorialScreen.tscn")
