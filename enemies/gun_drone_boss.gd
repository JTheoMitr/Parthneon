extends Area2D

@export var speed = 2.5

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
@onready var bossDrone1 = $BossDrone1
@onready var bossDrone2 = $BossDrone2
@onready var bossDrone3 = $BossDrone3
@onready var bossDrone4 = $BossDrone4
@onready var bossDrone5 = $BossDrone5
@onready var bossDrone6 = $BossDrone6
@onready var bossDrone7 = $BossDrone7
@onready var bossDrone8 = $BossDrone8
@onready var bossDrone9 = $BossDrone9
@onready var bossDrone10 = $BossDrone10
@onready var bossDrone11 = $BossDrone11
@onready var bossDrone12 = $BossDrone12
@onready var bossDrone13 = $BossDrone13
@onready var bossDrone14 = $BossDrone14
@onready var bossDrone15 = $BossDrone15
@onready var bossDrone16 = $BossDrone16
@onready var bossDrone17 = $BossDrone17
@onready var bossDrone18 = $BossDrone18
@onready var bossDrone19 = $BossDrone19
@onready var bossDrone20 = $BossDrone20
@onready var bossDrone21 = $BossDrone21
@onready var bossDrone22 = $BossDrone22
@onready var bossDrone23 = $BossDrone23
@onready var bossDrone24 = $BossDrone24
@onready var bossDrone25 = $BossDrone25
@onready var bossDrone26 = $BossDrone26
@onready var bossDrone27 = $BossDrone27
@onready var bossDrone28 = $BossDrone28
@onready var bossDrone29 = $BossDrone29
@onready var bossDrone30 = $BossDrone30
@onready var bossDrone31 = $BossDrone31
@onready var bossDrone32 = $BossDrone32
@onready var bossDrone33 = $BossDrone33
@onready var bossDrone34 = $BossDrone34
@onready var bossDrone35 = $BossDrone35
@onready var bossDrone36 = $BossDrone36
@onready var bossDrone37 = $BossDrone37
@onready var bossDrone38 = $BossDrone38
@onready var bossDrone39 = $BossDrone39
@onready var bossDrone40 = $BossDrone40
@onready var bossDrone41 = $BossDrone41
@onready var bossDrone42 = $BossDrone42
@onready var bossDrone43 = $BossDrone43
@onready var bossDrone44 = $BossDrone44
@onready var bossDrone45 = $BossDrone45
@onready var bossDrone46 = $BossDrone46
@onready var bossDrone47 = $BossDrone47
@onready var bossDrone48 = $BossDrone48
@onready var bossDrone49 = $BossDrone49
@onready var bossDrone50 = $BossDrone50
@onready var bossDrone51 = $BossDrone51
@onready var bossDrone52 = $BossDrone52
@onready var bossDrone53 = $BossDrone53
@onready var bossDrone54 = $BossDrone54
@onready var bossDrone55 = $BossDrone55
@onready var bossDrone56 = $BossDrone56
@onready var bossDrone57 = $BossDrone57
@onready var bossDrone58 = $BossDrone58
@onready var bossDrone59 = $BossDrone59
@onready var bossDrone60 = $BossDrone60
@onready var bossDrone61 = $BossDrone61
@onready var bossDrone62 = $BossDrone62
@onready var bossDrone63 = $BossDrone63
@onready var bossDrone64 = $BossDrone64
@onready var bossDrone65 = $BossDrone65
@onready var bossDrone66 = $BossDrone66
@onready var bossDrone67 = $BossDrone67
@onready var bossDrone68 = $BossDrone68
@onready var bossDrone69 = $BossDrone69
@onready var bossDrone70 = $BossDrone70
@onready var bossDrone71 = $BossDrone71
@onready var bossDrone72 = $BossDrone72
@onready var bossDrone73 = $BossDrone73
@onready var bossDrone74 = $BossDrone74
@onready var bossDrone75 = $BossDrone75
@onready var bossDrone76 = $BossDrone76
@onready var shootTimer = $ShootTimer

var enemy1 = preload("res://enemies/neon_bot_enemy1.tscn")

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

var shootCount = 0
var shoot1
var shoot2
var shoot3
var shoot4
var shoot5
var shoot6
var shoot7
var shoot8
var shoot9
var shoot10
var shoot11
var shoot12
var shoot13
var shoot14
var shoot15

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	
	if shoot1:
		if bossDrone45 != null:
			bossDrone45.global_position.x -= 5
	
	if shoot2:
		if bossDrone46 != null:
			bossDrone46.global_position.x -= 5
	
	if shoot3:
		if bossDrone44 != null:
			bossDrone44.global_position.x -= 5
			
	if shoot4:
		if bossDrone50 != null:
			bossDrone50.global_position.x -= 5
	
	if shoot5:
		if bossDrone43 != null:
			bossDrone43.global_position.x -= 5
	
	if shoot6:
		if bossDrone51 != null:
			bossDrone51.global_position.x -= 5
	
	if shoot7:
		if bossDrone42 != null:
			bossDrone42.global_position.x -= 5
			
	if shoot8:
		if bossDrone52 != null:
			bossDrone52.global_position.x -= 5
			
	if shoot9:
		if bossDrone41 != null:
			bossDrone41.global_position.x -= 5
	
	if shoot10:
		if bossDrone49 != null:
			bossDrone49.global_position.x -= 5
	
	if shoot11:
		if bossDrone40 != null:
			bossDrone40.global_position.x -= 5
			
	if shoot12:
		if bossDrone48 != null:
			bossDrone48.global_position.x -= 5
	
	if shoot13:
		if bossDrone39 != null:
			bossDrone39.global_position.x -= 5
	
	if shoot14:
		if bossDrone47 != null:
			bossDrone47.global_position.x -= 5
	
	if shoot15:
		if bossDrone38 != null:
			bossDrone38.global_position.x -= 5

	
	if self.global_position.x <= 475.0:
		if (stompStarted == false):
			speed = 0.0
			stompStarted = true
			shakeRTimer.start(0.0)
			movingRight = true
			
	if movingRight:
		self.global_position.x += 3.0
		
	if movingLeft:
		self.global_position.x -= 3.0
		
	if stomping:
		self.global_position.y += 5.0
		
	if lifting:
		self.global_position.y -= 2.0
			
	if rotating:
		self.rotation_degrees += 3.5
	#for dispersal:
	
	if send2:
		
		if bossDrone38 != null:
			bossDrone38.global_position.x -= 2.5
			bossDrone38.global_position.y += 1.0
		if bossDrone46 != null:
			bossDrone46.global_position.x -= 2.5
			bossDrone46.global_position.y -= 1.0
		if bossDrone39 != null:
			bossDrone39.global_position.x -= 2.5
			bossDrone39.global_position.y += 1.0
		if bossDrone40 != null:
			bossDrone40.global_position.x -= 2.5
			bossDrone40.global_position.y += 1.0
		if bossDrone44 != null:
			bossDrone44.global_position.x -= 2.5
			bossDrone44.global_position.y -= 1
		if bossDrone41 != null:
			bossDrone41.global_position.x -= 2.5
			bossDrone41.global_position.y += 1
		if bossDrone43 != null:
			bossDrone43.global_position.x -= 2.5
			bossDrone43.global_position.y -= 1
		if bossDrone42 != null:
			bossDrone42.global_position.x -= 2.5
			bossDrone42.global_position.y += 1
		#NE Quadrant
		if bossDrone1 != null:
			bossDrone1.global_position.y -= 1.0
			bossDrone1.global_position.x += 2.5
		if bossDrone2 != null:
			bossDrone2.global_position.y -= 1.0
			bossDrone2.global_position.x += 2.5
		if bossDrone3 != null:
			bossDrone3.global_position.y -= 1.0
			bossDrone3.global_position.x += 2.5
		if bossDrone4 != null:
			bossDrone4.global_position.y -= 1.0
			bossDrone4.global_position.x += 2.5
		if bossDrone5 != null:
			bossDrone5.global_position.y -= 1.0
			bossDrone5.global_position.x += 2.5
		if bossDrone6 != null:
			bossDrone6.global_position.y -= 1.0
			bossDrone6.global_position.x += 2.5
		if bossDrone7 != null:
			bossDrone7.global_position.y -= 1.0
			bossDrone7.global_position.x += 2.5
		if bossDrone8 != null:
			bossDrone8.global_position.y -= 1.0
			bossDrone8.global_position.x += 2.5
		if bossDrone9 != null:
			bossDrone9.global_position.y -= 1.0
			bossDrone9.global_position.x += 2.5
		if bossDrone49 != null:
			bossDrone49.global_position.y -= 1.0
			bossDrone49.global_position.x -= 2.5
		if bossDrone36 != null:
			bossDrone36.global_position.y -= 1.0
			bossDrone36.global_position.x -= 2.5
			
		#SE Quadrant
		if bossDrone10 != null:
			bossDrone10.global_position.y -= 1.0
			bossDrone10.global_position.x += 2.5
		if bossDrone11 != null:
			bossDrone11.global_position.y += 1.0
			bossDrone11.global_position.x += 2.5
		if bossDrone12 != null:
			bossDrone12.global_position.y += 1.0
			bossDrone12.global_position.x += 2.5
		if bossDrone13 != null:
			bossDrone13.global_position.y += 1.0
			bossDrone13.global_position.x += 2.5
		if bossDrone14 != null:
			bossDrone14.global_position.y += 1.0
			bossDrone14.global_position.x += 2.5
		if bossDrone15 != null:
			bossDrone15.global_position.y += 1.0
			bossDrone15.global_position.x += 2.5
		if bossDrone16 != null:
			bossDrone16.global_position.y += 1.0
			bossDrone16.global_position.x += 2.5
		if bossDrone17 != null:
			bossDrone17.global_position.y += 1.0
			bossDrone17.global_position.x += 2.5
		if bossDrone42 != null:
			bossDrone42.global_position.y += 1.0
			bossDrone42.global_position.x -= 2.5
		if bossDrone43 != null:
			bossDrone43.global_position.y -= 1.0
			bossDrone43.global_position.x -= 2.5
		if bossDrone44 != null:
			bossDrone44.global_position.y -= 1.0
			bossDrone44.global_position.x -= 2.5
		if bossDrone45 != null:
			bossDrone45.global_position.y -= 1.0
			bossDrone45.global_position.x -= 2.5
		if bossDrone46 != null:
			bossDrone46.global_position.y -= 1.0
			bossDrone46.global_position.x -= 2.5
		if bossDrone47 != null:
			bossDrone47.global_position.y -= 1.0
			bossDrone47.global_position.x -= 2.5
		
		#SW Quadrant
		if bossDrone37 != null:
			bossDrone37.global_position.y += 1.0
			bossDrone37.global_position.x -= 2.5
		if bossDrone38 != null:
			bossDrone38.global_position.y += 1.0
			bossDrone38.global_position.x -= 2.5
		if bossDrone39 != null:
			bossDrone39.global_position.y += 1.0
			bossDrone39.global_position.x -= 2.5
		if bossDrone40 != null:
			bossDrone40.global_position.y += 1.0
			bossDrone40.global_position.x -= 2.5
		if bossDrone41 != null:
			bossDrone41.global_position.y += 1.0
			bossDrone41.global_position.x -= 2.5
		if bossDrone18 != null:
			bossDrone18.global_position.y += 1.0
			bossDrone18.global_position.x += 2.5
		if bossDrone19 != null:
			bossDrone19.global_position.y += 1.0
			bossDrone19.global_position.x += 2.5
		if bossDrone20 != null:
			bossDrone20.global_position.y += 1.0
			bossDrone20.global_position.x += 2.5
		if bossDrone21 != null:
			bossDrone21.global_position.y += 1.0
			bossDrone21.global_position.x += 2.5
		if bossDrone22 != null:
			bossDrone22.global_position.y += 1.0
			bossDrone22.global_position.x += 2.5
		if bossDrone23 != null:
			bossDrone23.global_position.y += 1.0
			bossDrone23.global_position.x += 2.5
		if bossDrone24 != null:
			bossDrone24.global_position.y += 1.0
			bossDrone24.global_position.x += 2.5
		if bossDrone25 != null:
			bossDrone25.global_position.y += 1.0
			bossDrone25.global_position.x -= 2.5
		if bossDrone26 != null:
			bossDrone26.global_position.y += 1.0
			bossDrone26.global_position.x -= 2.5
			
		#NW Quadrant
		if bossDrone27 != null:
			bossDrone27.global_position.y -= 1.0
			bossDrone27.global_position.x -= 2.5
		if bossDrone28 != null:
			bossDrone28.global_position.y -= 1.0
			bossDrone28.global_position.x -= 2.5
		if bossDrone29 != null:
			bossDrone29.global_position.y -= 1.0
			bossDrone29.global_position.x -= 2.5
		if bossDrone30 != null:
			bossDrone30.global_position.y -= 1.0
			bossDrone30.global_position.x -= 2.5
		if bossDrone31 != null:
			bossDrone31.global_position.y -= 1.0
			bossDrone31.global_position.x -= 2.5
		if bossDrone32 != null:
			bossDrone32.global_position.y -= 1.0
			bossDrone32.global_position.x -= 2.5
		if bossDrone33 != null:
			bossDrone33.global_position.y -= 1.0
			bossDrone33.global_position.x -= 2.5
		if bossDrone34 != null:
			bossDrone34.global_position.y -= 1.0
			bossDrone34.global_position.x -= 2.5
		if bossDrone35 != null:
			bossDrone35.global_position.y -= 1.0
			bossDrone35.global_position.x -= 2.5
		if bossDrone48 != null:
			bossDrone48.global_position.y -= 1.0
			bossDrone48.global_position.x -= 2.5
		if bossDrone50 != null:
			bossDrone50.global_position.y -= 1.0
			bossDrone50.global_position.x -= 2.5
		if bossDrone51 != null:
			bossDrone51.global_position.y -= 1.0
			bossDrone51.global_position.x -= 2.5
		if bossDrone52 != null:
			bossDrone52.global_position.y -= 1.0
			bossDrone52.global_position.x -= 2.5
		if bossDrone53 != null:
			bossDrone53.global_position.y -= 1.0
			bossDrone53.global_position.x += 2.5
	if send3:
		#star drones
		
		if bossDrone54 != null:
			bossDrone54.global_position.x += 2.5
			bossDrone54.global_position.y += 0.07
		if bossDrone55 != null:
			bossDrone55.global_position.x += 2.5
			bossDrone55.global_position.y += 0.07
		if bossDrone56 != null:
			bossDrone56.global_position.x += 2.5
			bossDrone56.global_position.y += 0.07
		if bossDrone57 != null:
			bossDrone57.global_position.x += 2.5
			bossDrone57.global_position.y += 0.07
		if bossDrone58 != null:
			bossDrone58.global_position.x += 2.5
			bossDrone58.global_position.y += 0.07
		if bossDrone59 != null:
			bossDrone59.global_position.x += 2.5
			bossDrone59.global_position.y += 0.07
		if bossDrone60 != null:
			bossDrone60.global_position.x += 2.5
			bossDrone60.global_position.y += 0.07
		if bossDrone61 != null:
			bossDrone61.global_position.x += 2.5
			bossDrone61.global_position.y += 0.07
		if bossDrone62 != null:
			bossDrone62.global_position.x += 2.5
			bossDrone62.global_position.y += 0.07
		if bossDrone63 != null:
			bossDrone63.global_position.x += 2.5
			bossDrone63.global_position.y += 0.07
		if bossDrone64 != null:
			bossDrone64.global_position.x += 2.5
			bossDrone64.global_position.y += 0.07
		if bossDrone65 != null:
			bossDrone65.global_position.x += 2.5
			bossDrone65.global_position.y += 0.07
		if bossDrone66 != null:
			bossDrone66.global_position.x += 2.5
			bossDrone66.global_position.y += 0.07
		if bossDrone67 != null:
			bossDrone67.global_position.x += 2.5
			bossDrone67.global_position.y += 0.07
		if bossDrone68 != null:
			bossDrone68.global_position.x += 2.5
			bossDrone68.global_position.y += 0.07
		if bossDrone69 != null:
			bossDrone69.global_position.x += 2.5
			bossDrone69.global_position.y += 0.07
		if bossDrone70 != null:
			bossDrone70.global_position.x += 2.5
			bossDrone70.global_position.y += 0.07
		if bossDrone71 != null:
			bossDrone71.global_position.x += 2.5
			bossDrone71.global_position.y += 0.07
		if bossDrone72 != null:
			bossDrone72.global_position.x += 2.5
			bossDrone72.global_position.y += 0.07
		if bossDrone73 != null:
			bossDrone73.global_position.x += 2.5
			bossDrone73.global_position.y += 0.07
		if bossDrone74 != null:
			bossDrone74.global_position.x += 2.5
			bossDrone74.global_position.y += 0.07
		if bossDrone75 != null:
			bossDrone75.global_position.x += 2.5
			bossDrone75.global_position.y += 0.07
		if bossDrone76 != null:
			bossDrone76.global_position.x += 2.5
			bossDrone76.global_position.y += 0.07

		


	

func _on_disperse_timer_timeout() -> void:
	send2 = true
	send3 = true
	rotating = false
	qFreeTimer.start(0.0)
	

func _on_queue_free_timer_timeout() -> void:
	self.queue_free()


func _on_shake_r_timer_timeout() -> void:
	movingRight = false
	movingLeft = true
	shakeLTimer.start(0.0)


func _on_shake_l_timer_timeout() -> void:
	movingLeft = false
	movingRight = true
	aimTimer.start(0.0)


func _on_aim_timer_timeout() -> void:
	movingRight = false
	stomping = true
	stompTimer.start(0.0)
	shootTimer.start(0.0)

func _on_stomp_timer_timeout() -> void:
	stomping = false
	lifting = true
	liftTimer.start(0.0)
	
	


func _on_lift_timer_timeout() -> void:
	lifting = false
	waitTimer.start(0.0)
	
	
# from here, set up timers to move it left and right again to each side of the screen (R then L). On either side, set up and start the aimTimer again to cycle through the stomp animation each time, after the final time on LEFT, disperse all drones RIGHT


func _on_wait_timer_timeout() -> void:
	#if stompedOnce == false:
		#movingRight = true
		#stompedOnce = true
		#slideRTimer.start(0.0)
	#else:
		#movingLeft = true
		slideLTimer.start(0.0)
		rotating = true


func _on_slide_right_timer_timeout() -> void:
	#movingLeft = true
	movingRight = false
	stomping = true
	stompTimer2.start(0.0)
	
	#add another stomp here before sliding left, will need another stomptimer and wait timer that then initiates the slideL timer and movingleft true
	#add stomp sounds / some audio fx to stomps and entrance


func _on_slide_left_timer_timeout() -> void:
	#movingLeft = false
	disperseTimer.start(0.0)
	#rotating = true


func _on_stomp_timer_2_timeout() -> void:
	stomping = false
	lifting = true
	liftTimer.start(0.0)


func _on_shoot_timer_timeout() -> void:
	print_debug("shoot")
	shootCount += 1
	if shootCount == 1:
		shoot1 = true
	if shootCount == 2:
		shoot2 = true
	if shootCount == 3:
		shoot3 = true
	if shootCount == 4:
		shoot4 = true
	if shootCount == 5:
		shoot5 = true
	if shootCount == 6:
		shoot6 = true
	if shootCount == 7:
		shoot7 = true
	if shootCount == 8:
		shoot8 = true
	if shootCount == 9:
		shoot9 = true
	if shootCount == 10:
		shoot10 = true
	if shootCount == 11:
		shoot11 = true
	if shootCount == 12:
		shoot12 = true
	if shootCount == 13:
		shoot10 = true
	if shootCount == 14:
		shoot11 = true
	if shootCount == 15:
		shoot12 = true
