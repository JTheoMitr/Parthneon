extends Area2D

@export var speed = 1.0
@export var speed2 = 1.5

@onready var shakeLTimer = $ShakeLTimer
@onready var shakeRTimer = $ShakeRTimer
@onready var disperseTimer = $DisperseTimer
@onready var qFreeTimer = $QueueFreeTimer
@onready var stompTimer = $StompTimer
@onready var aimTimer = $AimTimer
@onready var liftTimer = $LiftTimer
@onready var waitTimer = $WaitTimer
@onready var slideRTimer = $SlideRightTimer
@onready var slideLTimer = $SlideLeftTimer
@onready var stompTimer2 = $StompTimer2
@onready var mechHeart = $MechHeart
@onready var heartMeter = $MechHeart/Sprite2D
@onready var crossHair = $MechHeart/Crosshair
@onready var heartNRG = $MechHeart/heartEnergy
@onready var shootTimer = $ShootTimer
@onready var bossEntrySound = $AudioStreamPlayer
@onready var blastFX = $AudioStreamPlayer2
@onready var swirl = $AudioStreamPlayer3
@onready var chargeUpSound = $ChargeSound
@onready var target = $TargetArea
@onready var visorScreen = $TargetArea/AnimatedSprite2D3
@onready var mech = $AnimatedSprite2D
@onready var buzzer = $AudioStreamPlayer4
@onready var explosionTimer = $ExplosionTimer

@onready var explosion = $Explosion
@onready var explosion2 = $Explosion2
@onready var explosion3 = $Explosion3
@onready var explosion4 = $Explosion4
@onready var explosion5 = $Explosion5
@onready var explosion6 = $Explosion6
@onready var explosion7 = $Explosion7
@onready var explosion8 = $Explosion8
@onready var explosion9 = $Explosion9
@onready var explosion10 = $Explosion10
@onready var explosion11 = $Explosion11
@onready var explosion12 = $Explosion12
@onready var explosion13 = $Explosion13
@onready var explosion14 = $Explosion14
@onready var explosion15 = $Explosion15
@onready var explosion16 = $Explosion16
@onready var explosion17 = $Explosion17
@onready var explosion18 = $Explosion18
@onready var explosion19 = $Explosion19

@onready var explosionSound = $ExplosionSound

@onready var cracked = $Cracked





const BossDrone = preload("res://enemies/boss_drone_1.tscn")

var stompStarted
var movingRight
var movingLeft
var stomping
var lifting
var send1
var send2
var send3
var stompedOnce
var rotating

var descending

var shootCount = 0
var explosionCount
var original_color

var living

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	send1 = false
	send2 = false
	send3 = false
	stompStarted = false
	movingRight = false
	movingLeft = false
	stomping = false
	lifting = false
	stompedOnce = false
	rotating = false
	bossEntrySound.play()
	heartMeter.visible = true
	heartNRG.visible = false
	crossHair.visible = false
	heartMeter.stop()
	heartMeter.frame = 0 #show and play where the lid was once opened
	original_color = visorScreen.self_modulate
	living = true
	descending = false
	explosionCount = 0
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	self.global_position.y -= speed2
	
	if descending:
		self.global_position.x -= 0.8
		self.global_position.y += 0.8
	

	if self.global_position.x <= 575.0 && living:
		if (stompStarted == false):
			speed = 0.0
			speed2 = 0.0
			stompStarted = true
			shakeRTimer.start(0.0)
			movingRight = true
			
	if movingRight:
		self.global_position.x += 3.0
		
	if movingLeft:
		self.global_position.x -= 3.0
		
	if stomping:
		self.global_position.y += 0.8
		
	if lifting:
		self.global_position.y -= 0.8
			
	if rotating:
		self.rotation_degrees += 2.3
	#for dispersal:
	
	#if mech.frame in [4, 5, 6, 20, 21, 22]:
		#mechHeart.position.y = -88
	#elif mech.frame in [3, 7, 19, 23]:
		#mechHeart.position.y = -106
	#else:
		#mechHeart.position.y = -126
			
	

	

func _on_disperse_timer_timeout() -> void:
	shootCount = 0
	shootTimer.start()
	send2 = true
	send3 = true
	rotating = false
	stomping = true
	await get_tree().create_timer(2.0).timeout
	stomping = false
	lifting = false
	await get_tree().create_timer(2.0).timeout
	stomping = false
	lifting = true
	await get_tree().create_timer(3.0).timeout
	stomping = true
	lifting = false
	await get_tree().create_timer(2.0).timeout
	stomping = false
	lifting = true
	await get_tree().create_timer(3.0).timeout
	stomping = false
	lifting = false
	

func _on_queue_free_timer_timeout() -> void:
	speed = 3.0
	bossEntrySound.play()
	await get_tree().create_timer(6.0).timeout
	self.queue_free()


func _on_shake_r_timer_timeout() -> void:
	movingRight = false
	#stomping = true
	shakeLTimer.start(0.0)


func _on_shake_l_timer_timeout() -> void:
	#stomping = false
	#lifting = true
	aimTimer.start(0.0)
	shootTimer.start(0.0)
	heartMeter.play("default")
	
	chargeUpSound.play()
	await get_tree().create_timer(2.3).timeout
	chargeUpSound.stop()
	#play an audioFX here for the heart lighting up

func _on_aim_timer_timeout() -> void:
	#lifting = false
	stomping = true
	stompTimer.start(0.0)
	

func _on_stomp_timer_timeout() -> void:
	stomping = false
	lifting = true
	liftTimer.start(0.0)


func _on_lift_timer_timeout() -> void:
	lifting = false
	#stomping = true
	waitTimer.start(0.0)
	
func _on_wait_timer_timeout() -> void:
	
		slideLTimer.start(0.0)
		stomping = false
		pulse_visor()
		#sword attack notice here...sound? visual pop? both?
		#maybe flash modulation color changes on the chest monitors and play an alert sound
		
		
func pulse_visor():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	# Each red→white cycle takes 0.5s, so 4 cycles = 2 seconds
	for i in range(4):
		buzzer.play()
		tween.tween_property(visorScreen, "self_modulate", Color(1, 0, 0), 0.25) # fade to red
		tween.tween_property(visorScreen, "self_modulate", original_color, 0.25) # fade back to normal


func _on_slide_right_timer_timeout() -> void:
	stompTimer2.start(0.0)



func _on_slide_left_timer_timeout() -> void:
	disperseTimer.start(0.0)
	rotating = true
	qFreeTimer.start(0.0)
	swirl.play()
	
	


func _on_stomp_timer_2_timeout() -> void:
	stomping = false
	lifting = true
	liftTimer.start(0.0)
	rotating = true


func _on_shoot_timer_timeout() -> void:
	blastFX.play()
	var bossDroneBullet = BossDrone.instantiate()
	#bossDroneBullet.global_position = target.global_position
	target.add_child(bossDroneBullet)
	print_debug(shootCount)
	shootCount += 1
	if shootCount >= 4:
		shootTimer.stop()


func _on_area_2d_area_entered(_area: Area2D) -> void:
	descending = true
	living = false
	lifting = false
	stomping = false
	explosion19.visible = true
	explosion19.play("default")
	
	explosionSound.play(0.0)
	mechHeart.visible = false
	cracked.visible = true
	explosionTimer.start()
	qFreeTimer.start()
	shootTimer.stop()
	aimTimer.stop()
	liftTimer.stop()
	waitTimer.stop()
	stompTimer.stop()
	stompTimer2.stop()
	shakeLTimer.stop()
	shakeRTimer.stop()
	disperseTimer.stop()
	
	pass # this is the mechHeart! touch? die?! (maybe not) flash? destory the mech! 
	#destroying the mech will trigger the explosions and slow crash animation, 
	#and award the player 1000(?)XP, look at basic enemies for trigger pattern (die vs eliminate)


func _on_sprite_2d_animation_finished() -> void:
	heartMeter.play("living")
	heartNRG.visible = true
	crossHair.visible = true


func _on_explosion_timer_timeout() -> void:
	match int(shootCount):
		1:
			explosion.visible = true
			explosion.play("default")
			explosionSound.play(0.0)
		2:
			explosion2.visible = true
			explosion2.play("default")
			explosionSound.play(0.0)
		3:
			explosion3.visible = true
			explosion3.play("default")
			explosionSound.play(0.0)
		4:
			explosion4.visible = true
			explosion4.play("default")	
			explosionSound.play(0.0)
		5:
			explosion5.visible = true
			explosion5.play("default")
			explosionSound.play(0.0)
		6:
			explosion6.visible = true
			explosion6.play("default")
			explosionSound.play(0.0)
		7:
			explosion7.visible = true
			explosion7.play("default")
			explosionSound.play(0.0)
		8:
			explosion8.visible = true
			explosion8.play("default")
			explosionSound.play(0.0)	
		9:
			explosion9.visible = true
			explosion9.play("default")
			explosionSound.play(0.0)
		10:
			explosion10.visible = true
			explosion10.play("default")
			explosionSound.play(0.0)
		11:
			explosion11.visible = true
			explosion11.play("default")
			explosionSound.play(0.0)
		12:
			explosion12.visible = true
			explosion12.play("default")	
			explosionSound.play(0.0)
		13:
			explosion13.visible = true
			explosion13.play("default")
			explosionSound.play(0.0)
		14:
			explosion14.visible = true
			explosion14.play("default")
			explosionSound.play(0.0)
		15:
			explosion15.visible = true
			explosion15.play("default")
			explosionSound.play(0.0)
		16:
			explosion16.visible = true
			explosion16.play("default")	
			explosionSound.play(0.0)
		17:
			explosion17.visible = true
			explosion17.play("default")
			explosionSound.play(0.0)
		18:
			explosion18.visible = true
			explosion18.play("default")	
			explosionSound.play(0.0)
			
	shootCount += 1
