extends Area2D

@export var speed = 2.0
@onready var anim = $AnimatedSprite2D
@onready var anim2 = $AnimatedSprite2D2
@onready var explosion = $AnimatedSprite2D3
@onready var bloop = $AudioStreamPlayer
@onready var points = $RichTextLabel
@onready var stats = PlayerStats
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")
	anim2.play("default")
	explosion.hide()
	points.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x += speed
	#self.rotation += .03
	
	
	


func _on_timer_timeout() -> void:
	self.queue_free()


func _on_area_entered(_area: Area2D) -> void:
	explosion.show()
	explosion.play("default")
	anim.hide()
	anim2.hide()
	bloop.play(0.0)
	points.show()
	$DeathTimer.start()
	stats.score += 15


func _on_animated_sprite_2d_3_animation_finished() -> void:
	self.queue_free()


func _on_death_timer_timeout() -> void:
	self.queue_free()
