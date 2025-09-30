extends AnimatedSprite2D

@onready var drone1 = $Drone1
@onready var drone2 = $Drone2
@onready var drone3 = $Drone3
@onready var drone4 = $Drone4
@onready var deploySound = $AudioStreamPlayer
var deploying
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drone1.visible = false
	drone2.visible = false
	drone3.visible = false
	drone4.visible = false
	deploying = false
	self.frame = 0
	self.play("default")
	deploySound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if deploying:
		drone1.global_position.y += 3
		drone1.global_position.x -= .1
		drone2.global_position.y += 3
		drone3.global_position.y += 3
		drone4.global_position.y += 3
		drone4.global_position.x += .01
		


func _on_timer_timeout() -> void:
	drone1.visible = true
	drone2.visible = true
	drone3.visible = true
	drone4.visible = true
	deploying = true
	


func _on_timer_2_timeout() -> void:
	self.queue_free()


func _on_animation_finished() -> void:
	self.visible = false
