extends AnimatableBody2D

@export var speed = 1.0
@export var lift = 0.0
var real_pos : Vector2
var stats = PlayerStats
var global_tracking = GlobalTracking

@onready var blinkingRed = $Sprite2D8/BlinkingRed
@onready var blinkTimer = $Timer2
@onready var alarm = $Alarm

@onready var lab_1_screen_2 =  $Screen2

@onready var lab_man_1 = $LabNPC1

@onready var light_glow_1 = $Sprite2D35/LightGlow1
@onready var light_glow_2 = $Sprite2D44/LightGlow2
@onready var light_glow_3 = $Sprite2D45/LightGlow3
@onready var light_glow_4 = $Sprite2D46/LightGlow4
@onready var light_glow_5 = $Sprite2D47/LightGlow5
@onready var light_glow_6 = $Sprite2D48/LightGlow6
@onready var light_glow_7 = $Sprite2D49/LightGlow7
@onready var light_glow_8 = $Sprite2D50/LightGlow8
@onready var light_glow_9 = $Sprite2D51/LightGlow9
@onready var light_glow_10 = $Sprite2D52/LightGlow10
@onready var light_glow_11 = $Sprite2D69/LightGlow11
@onready var neon_arrow_1 = $Sprite2D70

@onready var outer_panel = $OuterPanel1
@onready var outer_panel2 = $OuterPanel2
@onready var outer_panel3 = $OuterPanel3
@onready var outer_panel4 = $OuterPanel4
@onready var outer_panel5 = $OuterPanel5
@onready var outer_panel6 = $OuterPanel6
@onready var outer_panel7 = $OuterPanel7
@onready var outer_panel8 = $OuterPanel8

@onready var haven5 = $OuterPanel3/RichTextLabel
@onready var flag = $OuterPanel3/Sprite2D

@onready var glitch_overlay = $AnimatedSprite2D4
@onready var glitch_sfx = $AudioStreamPlayer2D

var lab_man_right
var lab_man_left

var light_glow_up
var light_glow_down

var neon_arrow_left
var neon_arrow_right

var panel_fading

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	real_pos = position
	blinkTimer.stop()
	lab_man_right = true
	lab_man_left = false
	light_glow_down = true
	neon_arrow_left = true
	neon_arrow_right = false
	glitch_overlay.hide()
	panel_fading = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	real_pos.x -= speed
	#self.global_position.y += lift
	position = real_pos.round()
	
	if lab_man_1.position.x > 628.0:
		lab_man_right = false
		lab_man_left = true
		
	if lab_man_1.position.x < 278.0:
		lab_man_right = true
		lab_man_left = false
		
	if lab_man_left:
		lab_man_1.flip_h = true
		lab_man_1.position.x -= 1.0
		
	if lab_man_right:
		lab_man_1.flip_h = false
		lab_man_1.position.x += 1.0
		
	if light_glow_down:
		if light_glow_1.self_modulate.a >= 0.0:
			light_glow_1.self_modulate.a -= 0.005
			light_glow_2.self_modulate.a += 0.005
			light_glow_3.self_modulate.a -= 0.005
			light_glow_4.self_modulate.a += 0.005
			light_glow_5.self_modulate.a -= 0.005
			light_glow_6.self_modulate.a += 0.005
			light_glow_7.self_modulate.a -= 0.005
			light_glow_8.self_modulate.a += 0.005
			light_glow_9.self_modulate.a -= 0.005
			light_glow_10.self_modulate.a += 0.005
			light_glow_11.self_modulate.a += 0.005

		
	if light_glow_up:
		if light_glow_1.self_modulate.a <= 1.0:
			light_glow_1.self_modulate.a += 0.005
			light_glow_2.self_modulate.a -= 0.005
			light_glow_3.self_modulate.a += 0.005
			light_glow_4.self_modulate.a -= 0.005
			light_glow_5.self_modulate.a += 0.005
			light_glow_6.self_modulate.a -= 0.005
			light_glow_7.self_modulate.a += 0.005
			light_glow_8.self_modulate.a -= 0.005
			light_glow_9.self_modulate.a += 0.005
			light_glow_10.self_modulate.a -= 0.005
			light_glow_11.self_modulate.a -= 0.005
			
	if neon_arrow_left:
		neon_arrow_1.global_position.x -= 0.6
	if neon_arrow_right:
		neon_arrow_1.global_position.x += 0.6
		
	if panel_fading:
		outer_panel.self_modulate.a -= .01
		outer_panel2.self_modulate.a -= .01
		outer_panel3.self_modulate.a -= .01
		outer_panel4.self_modulate.a -= .01
		outer_panel5.self_modulate.a -= .01
		outer_panel6.self_modulate.a -= .01
		outer_panel7.self_modulate.a -= .01
		outer_panel8.self_modulate.a -= .01
		haven5.self_modulate.a -= .01
		flag.self_modulate.a -= .01


func _on_timer_timeout() -> void:
	self.queue_free()


func _on_timer_2_timeout() -> void:
	if blinkingRed.visible:
		blinkingRed.visible = false
		alarm.stop()
	else:
		blinkingRed.visible = true
		alarm.play()
		


func _on_area_2d_area_entered(_area: Area2D) -> void:
	blinkTimer.start(0.0)
	
	#alarm.play()


func _on_area_2d_area_exited(_area: Area2D) -> void:
	blinkTimer.stop()
	alarm.stop()


func _on_timer_3_timeout() -> void:
	if lab_1_screen_2.visible:
		lab_1_screen_2.visible = false
	else:
		lab_1_screen_2.visible = true


func _on_timer_4_timeout() -> void:
	if light_glow_down:
		light_glow_up = true
		light_glow_down = false
	else:
		light_glow_down = true
		light_glow_up = false


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	glitch_overlay.show()
	global_tracking.emit_signal("space_lab_entered")
	glitch_sfx.play()
	panel_fading = true
	


func _on_timer_5_timeout() -> void:
	
	if neon_arrow_left:
		neon_arrow_right = true
		neon_arrow_left = false
	else:
		neon_arrow_left = true
		neon_arrow_right = false


func _on_area_2d_3_area_entered(area: Area2D) -> void:
	global_tracking.emit_signal("timers_startup")
	glitch_overlay.hide()
