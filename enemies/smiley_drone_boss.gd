extends Area2D

@export var speed = 3.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	
	if self.global_position.x <= 475.0:
		speed = 0.0
