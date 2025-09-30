extends Area2D

@export var speed = 0.6

var skewUp
var skewDown
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	skewUp = true
	skewDown = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	#self.rotation += .03
	if skewUp:
		self.skew += .01
	if skewDown:
		self.skew -= .01
	
	

func _on_timer_timeout() -> void:
	self.queue_free()


func _on_timer_2_timeout() -> void:
	if skewUp == true:
		skewDown = true
		skewUp = false
	else:
		skewUp = true
		skewDown = false
