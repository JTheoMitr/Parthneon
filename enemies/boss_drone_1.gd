extends Area2D

@export var speed = 3.0


@onready var explosion = $AnimatedSprite2D3
@onready var bloop = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	explosion.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	self.global_position.x -= speed
	#self.rotation += .03
	
	
	


func _on_timer_timeout() -> void:
	pass
	#self.queue_free()


func _on_area_entered(_area: Area2D) -> void:
	explosion.show()
	explosion.play("default")
	bloop.play(0.0)
	print("boss drone destroyed")


func _on_animated_sprite_2d_3_animation_finished() -> void:
	self.queue_free()
