extends Area2D

@export var speed = 2.5

@onready var frownTimer = $FrownTimer
@onready var frownFreezeTimer = $FrownFreezeTimer
@onready var disperseTimer = $DisperseTimer
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


var frowning
var send1
var send2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frowning = false
	send1 = false
	send2 = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position.x -= speed
	
	if self.global_position.x <= 475.0:
		if (frowning == false):
			speed = 0.0
			frowning = true
			frownTimer.start(0.0)
	
	if send1:
		if bossDrone38 != null:
			bossDrone38.global_position.y -= .13
		if bossDrone46 != null:
			bossDrone46.global_position.y -= .13
		if bossDrone39 != null:
			bossDrone39.global_position.y -= .23
		if bossDrone45 != null:
			bossDrone45.global_position.y -= .23
		if bossDrone40 != null:
			bossDrone40.global_position.y -= .3
		if bossDrone44 != null:
			bossDrone44.global_position.y -= .3
		if bossDrone41 != null:
			bossDrone41.global_position.y -= .35
		if bossDrone43 != null:
			bossDrone43.global_position.y -= .35
		if bossDrone42 != null:
			bossDrone42.global_position.y -= .36
	
	if send2:
		#NE Quadrant
		if bossDrone1 != null:
			bossDrone1.global_position.y -= 1.0
			bossDrone1.global_position.x += 0.1
		if bossDrone2 != null:
			bossDrone2.global_position.y -= 1.0
			bossDrone2.global_position.x += 0.2
		if bossDrone3 != null:
			bossDrone3.global_position.y -= 1.0
			bossDrone3.global_position.x += 0.3
		if bossDrone4 != null:
			bossDrone4.global_position.y -= 1.0
			bossDrone4.global_position.x += 0.4
		if bossDrone5 != null:
			bossDrone5.global_position.y -= 1.0
			bossDrone5.global_position.x += 0.5
		if bossDrone6 != null:
			bossDrone6.global_position.y -= 1.0
			bossDrone6.global_position.x += 0.6
		if bossDrone7 != null:
			bossDrone7.global_position.y -= 1.0
			bossDrone7.global_position.x += 0.7
		if bossDrone8 != null:
			bossDrone8.global_position.y -= 1.0
			bossDrone8.global_position.x += 0.8
		if bossDrone9 != null:
			bossDrone9.global_position.y -= 1.0
			bossDrone9.global_position.x += 0.9
		if bossDrone49 != null:
			bossDrone49.global_position.y -= 1.0
			bossDrone49.global_position.x += 0.3
		if bossDrone36 != null:
			bossDrone36.global_position.y -= 1.0
			bossDrone36.global_position.x += 0.1
			
		#SE Quadrant
		if bossDrone10 != null:
			bossDrone10.global_position.y += 1.0
			bossDrone10.global_position.x += 0.9
		if bossDrone11 != null:
			bossDrone11.global_position.y += 1.0
			bossDrone11.global_position.x += 0.8
		if bossDrone12 != null:
			bossDrone12.global_position.y += 1.0
			bossDrone12.global_position.x += 0.7
		if bossDrone13 != null:
			bossDrone13.global_position.y += 1.0
			bossDrone13.global_position.x += 0.6
		if bossDrone14 != null:
			bossDrone14.global_position.y += 1.0
			bossDrone14.global_position.x += 0.5
		if bossDrone15 != null:
			bossDrone15.global_position.y += 1.0
			bossDrone15.global_position.x += 0.4
		if bossDrone16 != null:
			bossDrone16.global_position.y += 1.0
			bossDrone16.global_position.x += 0.3
		if bossDrone17 != null:
			bossDrone17.global_position.y += 1.0
			bossDrone17.global_position.x += 0.2
		if bossDrone42 != null:
			bossDrone42.global_position.y += 1.0
			bossDrone42.global_position.x += 0.2
		if bossDrone43 != null:
			bossDrone43.global_position.y += 1.0
			bossDrone43.global_position.x += 0.3
		if bossDrone44 != null:
			bossDrone44.global_position.y += 1.0
			bossDrone44.global_position.x += 0.4
		if bossDrone45 != null:
			bossDrone45.global_position.y += 1.0
			bossDrone45.global_position.x += 0.5
		if bossDrone46 != null:
			bossDrone46.global_position.y += 1.0
			bossDrone46.global_position.x += 0.6
		if bossDrone47 != null:
			bossDrone47.global_position.y += 1.0
			bossDrone47.global_position.x += 0.7
		
		#SW Quadrant
		if bossDrone37 != null:
			bossDrone37.global_position.y += 1.0
			bossDrone37.global_position.x -= 0.7
		if bossDrone38 != null:
			bossDrone38.global_position.y += 1.0
			bossDrone38.global_position.x -= 0.6
		if bossDrone39 != null:
			bossDrone39.global_position.y += 1.0
			bossDrone39.global_position.x -= 0.5
		if bossDrone40 != null:
			bossDrone40.global_position.y += 1.0
			bossDrone40.global_position.x -= 0.4
		if bossDrone41 != null:
			bossDrone41.global_position.y += 1.0
			bossDrone41.global_position.x -= 0.3
		if bossDrone18 != null:
			bossDrone18.global_position.y += 1.0
			bossDrone18.global_position.x -= 0.2
		if bossDrone19 != null:
			bossDrone19.global_position.y += 1.0
			bossDrone19.global_position.x -= 0.3
		if bossDrone20 != null:
			bossDrone20.global_position.y += 1.0
			bossDrone20.global_position.x -= 0.4
		if bossDrone21 != null:
			bossDrone21.global_position.y += 1.0
			bossDrone21.global_position.x -= 0.5
		if bossDrone22 != null:
			bossDrone22.global_position.y += 1.0
			bossDrone22.global_position.x -= 0.6
		if bossDrone23 != null:
			bossDrone23.global_position.y += 1.0
			bossDrone23.global_position.x -= 0.7
		if bossDrone24 != null:
			bossDrone24.global_position.y += 1.0
			bossDrone24.global_position.x -= 0.8
		if bossDrone25 != null:
			bossDrone25.global_position.y += 1.0
			bossDrone25.global_position.x -= 0.9
		if bossDrone26 != null:
			bossDrone26.global_position.y += 1.0
			bossDrone26.global_position.x -= 1.0
			
		#NW Quadrant
		if bossDrone27 != null:
			bossDrone27.global_position.y -= 1.0
			bossDrone27.global_position.x -= 1.0	
		if bossDrone28 != null:
			bossDrone28.global_position.y -= 1.0
			bossDrone28.global_position.x -= 0.9
		if bossDrone29 != null:
			bossDrone29.global_position.y -= 1.0
			bossDrone29.global_position.x -= 0.8
		if bossDrone30 != null:
			bossDrone30.global_position.y -= 1.0
			bossDrone30.global_position.x -= 0.7
		if bossDrone31 != null:
			bossDrone31.global_position.y -= 1.0
			bossDrone31.global_position.x -= 0.6
		if bossDrone32 != null:
			bossDrone32.global_position.y -= 1.0
			bossDrone32.global_position.x -= 0.7
		if bossDrone33 != null:
			bossDrone33.global_position.y -= 1.0
			bossDrone33.global_position.x -= 0.6
		if bossDrone34 != null:
			bossDrone34.global_position.y -= 1.0
			bossDrone34.global_position.x -= 0.5
		if bossDrone35 != null:
			bossDrone35.global_position.y -= 1.0
			bossDrone35.global_position.x -= 0.4

func _on_frown_timer_timeout() -> void:
	send1 = true
	frownFreezeTimer.start(0.0)


func _on_frown_freeze_timer_timeout() -> void:
	send1 = false
	disperseTimer.start(0.0)
	

func _on_disperse_timer_timeout() -> void:
	send2 = true
