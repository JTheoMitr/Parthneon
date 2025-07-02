extends Area2D

@export var speed = 0.0

@onready var bloop = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	#self.rotation += .03
	
	

func _on_area_entered(_area: Area2D) -> void:
	
	bloop.play(0.0)
	
	$DeathTimer.start()
	


func _on_death_timer_timeout() -> void:
	self.queue_free()
