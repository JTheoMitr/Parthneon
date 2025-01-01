extends AnimatableBody2D

@export var speed = 1
@export var lift = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	#self.global_position.y += lift


func _on_timer_timeout() -> void:
	self.queue_free()
