extends Area2D


@onready var anim = $AnimatedSprite2D
@onready var hitbox = $CollisionShape2D
@onready var contact_smoke = $AnimatedSprite2D4
@onready var smoke_timer = $SmokeTimer
@onready var squanch = $AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_smoke.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if anim.frame == 4 || anim.frame == 5:
		hitbox.disabled = false
	else:
		hitbox.disabled = true
	#self.rotation += .03
	
	


func _on_area_entered(area: Area2D) -> void:
	contact_smoke.show()
	smoke_timer.start()
	squanch.play()
	


func _on_smoke_timer_timeout() -> void:
	contact_smoke.hide()
