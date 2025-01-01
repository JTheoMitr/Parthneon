extends Area2D

@export var speed = 3.0

@onready var anim = $AnimatedSprite2D
@onready var anim2 = $AnimatedSprite2D2
@onready var explosion = $AnimatedSprite2D3
@onready var bloop = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")
	anim2.play("default")
	explosion.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#self.global_position.x -= speed
	#self.rotation += .03
	
	
	


func _on_timer_timeout() -> void:
	pass
	#self.queue_free()


func _on_area_entered(_area: Area2D) -> void:
	explosion.show()
	explosion.play("default")
	anim.hide()
	anim2.hide()
	bloop.play(0.0)


func _on_animated_sprite_2d_3_animation_finished() -> void:
	self.queue_free()
