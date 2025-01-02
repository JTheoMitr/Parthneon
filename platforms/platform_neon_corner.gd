extends AnimatableBody2D

@export var speed = 1.0
@export var lift = 0.0
var real_pos : Vector2
var stats = PlayerStats

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	real_pos = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if stats.bossPhase == false:
		real_pos.x -= speed
		
	else:
		real_pos.x += speed
	#self.global_position.y += lift
	position = real_pos.round()


func _on_timer_timeout() -> void:
	self.queue_free()
