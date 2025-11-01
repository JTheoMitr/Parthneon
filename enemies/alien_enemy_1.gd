extends Area2D

@export var speed = 2.0
@onready var anim = $AnimatedSprite2D

@onready var explosion = $AnimatedSprite2D3
@onready var bloop = $AudioStreamPlayer
@onready var points = $RichTextLabel
@onready var stats = PlayerStats
@onready var hitbox = $CollisionShape2D

var bug = preload("res://enemies/bug.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")

	explosion.hide()
	points.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	#self.rotation += .03
	
	
	


func _on_timer_timeout() -> void:
	self.queue_free()


func _on_area_entered(_area: Area2D) -> void:
	explosion.show()
	explosion.play("default")
	anim.hide()

	bloop.play(0.0)
	points.show()
	$DeathTimer.start()
	stats.score += 15
	hitbox.queue_free()
	
	await get_tree().create_timer(0.5).timeout

	var bug1 = bug.instantiate()
	bug1.global_position.x = self.global_position.x
	bug1.global_position.y = self.global_position.y
	get_parent().add_child(bug1)
	var bug2 = bug.instantiate()
	bug2.global_position.x = self.global_position.x
	bug2.global_position.y = self.global_position.y
	get_parent().add_child(bug2)
	var bug3 = bug.instantiate()
	bug3.global_position.x = self.global_position.x
	bug3.global_position.y = self.global_position.y
	get_parent().add_child(bug3)
	var bug4 = bug.instantiate()
	bug4.global_position.x = self.global_position.x
	bug4.global_position.y = self.global_position.y
	get_parent().add_child(bug4)
	var bug5 = bug.instantiate()
	bug5.global_position.x = self.global_position.x
	bug5.global_position.y = self.global_position.y
	get_parent().add_child(bug5)
	var bug6 = bug.instantiate()
	bug6.global_position.x = self.global_position.x
	bug6.global_position.y = self.global_position.y
	get_parent().add_child(bug6)
	var bug7 = bug.instantiate()
	bug7.global_position.x = self.global_position.x
	bug7.global_position.y = self.global_position.y
	get_parent().add_child(bug7)
	var bug8 = bug.instantiate()
	bug8.global_position.x = self.global_position.x
	bug8.global_position.y = self.global_position.y
	get_parent().add_child(bug8)
	var bug9 = bug.instantiate()
	bug9.global_position.x = self.global_position.x
	bug9.global_position.y = self.global_position.y
	get_parent().add_child(bug9)


func _on_animated_sprite_2d_3_animation_finished() -> void:
	explosion.hide()
	


func _on_death_timer_timeout() -> void:
	self.queue_free()
