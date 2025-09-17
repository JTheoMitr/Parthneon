extends Area2D

@export var speed = 1.6
var mechSpeed = 4.0

@onready var launchAnim = $AnimatedSprite2D
@onready var mech = $Mech
@onready var whoosh = $Whoosh

var mechLocked
var launched
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	launched = false
	mech.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	if launched:
		mech.visible = true
		mech.global_position.x += mechSpeed
		mech.scale += Vector2(0.7, 0.7) * _delta
	#self.rotation += .03
	if self.global_position.x <= 475.0 && launched == false:
		launchAnim.play("default")
		whoosh.play()
		launched = true
		
		
	
	

func _on_timer_timeout() -> void:
	self.queue_free()
