extends AnimatableBody2D

@export var speed = 1.0
@export var lift = 0.0
var real_pos : Vector2
var stats = PlayerStats

@onready var blinkingRed = $Sprite2D8/BlinkingRed
@onready var blinkTimer = $Timer2
@onready var alarm = $Alarm

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	real_pos = position
	blinkTimer.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	real_pos.x -= speed
	#self.global_position.y += lift
	position = real_pos.round()


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
