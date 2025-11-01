extends Area2D


@onready var buganim = $AnimSprite
@onready var timer = $Timer
@onready var stats = PlayerStats
@onready var pickupSound = $PickUpSound
@onready var explode = $AnimatedSprite2D

var rng = RandomNumberGenerator.new()
var randomNumber
var randomNumber2

var grabbed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grabbed = false
	explode.hide
	randomNumber = rng.randf_range(-100, 100)
	randomNumber2 = rng.randf_range(-100, 100)
	#print_debug("Im here, da buggy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x += randomNumber / 100
	self.global_position.y += randomNumber2 / 100


func _on_area_entered(_area: Area2D) -> void:
	if grabbed == false:
		buganim.hide()
		timer.start()
		stats.score += 10
		pickupSound.play(0.0)
		grabbed = true
		explode.show()
		explode.play("default")
	
	

func _on_timer_timeout() -> void:
	self.queue_free()


func _on_animated_sprite_2d_animation_finished() -> void:
	self.queue_free()
