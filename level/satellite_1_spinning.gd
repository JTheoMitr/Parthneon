extends Area2D

@export var speed = 1.8
var mechSpeed = 4.0

@onready var launchAnim = $AnimatedSprite2D
@onready var mech = $Mech
@onready var whoosh = $Whoosh
@onready var launchSound = $LaunchSound

var mechLocked
var launched
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	launched = false
	mech.visible = false
	launchAnim.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	if launched:
		mech.visible = true
		mech.global_position.x += mechSpeed
		mech.scale += Vector2(1.2, 1.2) * _delta # og is 0.7
	#self.rotation += .03
	if self.global_position.x <= 475.0 && launched == false:
		launchAnim.visible = true
		launchAnim.play("default")
		whoosh.play()
		launchSound.play()
		launched = true
		
		
	
	

func _on_timer_timeout() -> void:
	self.queue_free()
