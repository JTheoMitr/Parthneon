extends Area2D

@onready var pntsMsg = $RichTextLabel
@onready var nrg = $AnimatedSprite2D
@onready var timer = $Timer
@onready var stats = PlayerStats
@onready var pickupSound = $PickUpSound
@onready var collision = $CollisionShape2D
@onready var explode = $Explode

var grabbed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	pntsMsg.hide()
	nrg.play("default")
	grabbed = false
	explode.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_entered(_area: Area2D) -> void:
	if grabbed == false:
		pntsMsg.show()
		nrg.hide()
		timer.start()
		stats.score += 10
		pickupSound.play(0.0)
		grabbed = true
		explode.show()
		explode.play("default")
	
	


func _on_timer_timeout() -> void:
	self.queue_free()


func _on_timer_2_timeout() -> void:
	self.queue_free()


func _on_explode_animation_finished() -> void:
	explode.hide()
