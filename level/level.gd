extends Node2D

@onready var pv1 = $PlatformVerticalOneBT
@onready var pv2 = $PlatformVerticalTwoTB
@onready var pv3 = $PlatformVerticalOneBT2
@onready var pv4 = $PlatformVerticalTwoTB2
@onready var player = $SkeletalPlayer
@onready var gametimer = $GameTimer1
@onready var gametimer2 = $GameTimer2
@onready var timerDisplay = $TimerDisplay
@onready var timerDisplay2 = $TimerDisplay2
@onready var scoreDisplay = $ScoreDisplay
@onready var stats = PlayerStats
@onready var levelSong = $LevelSong
@onready var neonPrison = $NeonPrison
@onready var energyTimer = $EnergyTimer1
@onready var energyTimer2 = $EnergyTimer2
@onready var timerDisplay3 = $TimerDisplay3
@onready var ding = $Ding
@onready var deathDisplayTimer = $DeathDisplayTimer
@onready var multiTimer = $MultiplyTimer
@onready var scoreBoom = $ScoreBoom
@onready var scoreBox = $Sprite2D2
@onready var scroom = $Scroom
@onready var scoreSweep = $ScoreSweep
@onready var overlay = $Overlay
@onready var hbox = $HBoxContainer
@onready var button1 = $HBoxContainer/Button
@onready var nightSky = $NightSky
@onready var nightSky2 = $NightSky2
@onready var xDisplay = $XDisplay


var rng = RandomNumberGenerator.new()
var breathing
var long1 = preload("res://platforms/platform_neon_long_one_horiz.tscn")
var short1 = preload("res://platforms/platform_neon_short_one_horiz.tscn")
var bcross1 = preload("res://platforms/neon_blue_cross_platform_slippery.tscn")
var nrg1 = preload("res://items/energy_points_1.tscn")
var nrg2 = preload("res://items/energy_points_2.tscn")
var corner1 = preload("res://platforms/platform_neon_corner.tscn")
var enemy1 = preload("res://enemies/neon_bot_enemy1.tscn")
var enemy2 = preload("res://enemies/neon_bot_enemy2.tscn")
var blueT1 = preload("res://platforms/platform_neon_T_blue.tscn")

var timerStart
var timerStart2
var timeScroll
var scoreFontSize


func _ready():
	timerStart = 0
	timerStart2 = 0
	timeScroll = false
	scoreFontSize = 250
	var camera = find_child("Camera2D")
	var min_pos = $CameraLimit_min.global_position
	var max_pos = $CameraLimit_max.global_position
	camera.limit_left = min_pos.x
	camera.limit_top = min_pos.y
	camera.limit_right = max_pos.x
	camera.limit_bottom = max_pos.y
	levelSong.play(0.0)
	timerDisplay.hide()
	timerDisplay2.hide()
	timerDisplay3.hide()
	await get_tree().create_timer(1.0).timeout
	timerDisplay3.show()
	$GetReady.play(0.0)
	$NightSky.play()
	breathing = true
	scoreBoom.hide()
	overlay.hide()
	hbox.hide()
	pv1.speed = 1
	pv2.speed = 1

	stats.alive = true
	stats.score = 0
	stats.health = 1
	print_debug("readying up")
	print_debug(timerDisplay.global_position.x)
	
	
	
func _process(_delta: float) -> void:
	
	#nightsky background mvmt
	nightSky.global_position.x -= .08
	nightSky2.global_position.x -= .08
	if (nightSky.global_position.x <= 0):
		nightSky.global_position.x = 960
	if (nightSky2.global_position.x <= 0):
		nightSky2.global_position.x = 960	
	#basic staticbody plats, constantly running for now
	if pv1.global_position.y <= -700:
		pv1.global_position.y = 390
	if pv2.global_position.y >= 390:
		pv2.global_position.y = -700
	if pv3.global_position.y <= -700:
		pv3.global_position.y = 390
	if pv4.global_position.y >= 390:
		pv4.global_position.y = -700
		
		#player management on L and R sides
	if player.global_position.x <= 230:
		player.global_position.x = 729
	if player.global_position.x >= 730:
		player.global_position.x = 229
	
	if timeScroll:
		xDisplay.global_position.y -= 1.7
		timerDisplay.global_position.y += 1
		timerDisplay.global_position.x -= .7
		#adjust scoreDisplay global x movement based on score
		if stats.score < 10:
			scoreDisplay.global_position.x -= 2.8
		if (stats.score >= 10 && stats.score <= 99):
			scoreDisplay.global_position.x -= 2.67
		if (stats.score >= 100 && stats.score <= 999):
			scoreDisplay.global_position.x -= 2.38
		if stats.score >= 1000:
			scoreDisplay.global_position.x -= 2.15
		scoreDisplay.global_position.y += .87
		scoreDisplay.scale.x += .00078
		scoreDisplay.scale.y += .00078
		scoreBox.hide()
		
	if timerDisplay.global_position.y >= -75:
		timeScroll = false
	
	#timer displays
	if stats.alive:
		timerDisplay.text = "[center]" +str(timerStart)
		timerDisplay2.text = "[center]" +str(timerStart2)
		timerStart2 += 3
	#score display
		scoreDisplay.text = " " + str(stats.score)
	if stats.alive == false:
		if breathing:
			breathing = false
			gametimer.stop()
			gametimer2.stop()
			timerDisplay2.hide()
			timeScroll = true
			_death_display()
			scoreSweep.play(0.0)
			var tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_SINE)
			tween.tween_property(levelSong, "volume_db", -35.0, 3.5)
			
		
	


func _on_timer_timeout() -> void:
	#use various timers to instance different platform types with various speeds and starting positions
	#longNeon1
	var my_random_number_x = rng.randf_range(1550.0, 5000.0)
	var my_random_number_y = rng.randf_range(-135.0, 65.0)
	#blueCross1
	var my_random_number_x2 = rng.randf_range(950.0, 3500.0)
	var my_random_number_y2 = rng.randf_range(-135.0, 65.0)
	#corner1
	var my_random_number_x3 = rng.randf_range(950.0, 3500.0)
	var my_random_number_y3 = rng.randf_range(-135.0, 65.0)
	#enemy1
	var my_random_number_x4 = rng.randf_range(950.0, 3500.0)
	var my_random_number_y4 = rng.randf_range(-135.0, 65.0)
	#enemy2 L->R
	var my_random_number_x5 = rng.randf_range(-1950.0, -180.0)
	var my_random_number_y5 = rng.randf_range(-135.0, 65.0)
	#bluetee
	var my_random_number_x6 = rng.randf_range(1250.0, 3570.0)
	var my_random_number_y6 = rng.randf_range(-135.0, 65.0)
	#blueCross2
	#var my_random_number_x8 = rng.randf_range(3505.0, 5500.0)
	#var my_random_number_y8 = rng.randf_range(-135.0, 65.0)
	#corner2
	var my_random_number_x9 = rng.randf_range(3500.0, 5500.0)
	var my_random_number_y9 = rng.randf_range(-135.0, 65.0)
	
	var longNeon1 = long1.instantiate()
	longNeon1.global_position.x = my_random_number_x
	longNeon1.global_position.y = my_random_number_y
	add_child(longNeon1)
	var blue1 = bcross1.instantiate()
	blue1.global_position.x = my_random_number_x2
	blue1.global_position.y = my_random_number_y2
	add_child(blue1)
	var korner1 = corner1.instantiate()
	korner1.global_position.x = my_random_number_x3
	korner1.global_position.y = my_random_number_y3
	add_child(korner1)
	var enemyOne = enemy1.instantiate()
	enemyOne.global_position.x = my_random_number_x4
	enemyOne.global_position.y = my_random_number_y4
	add_child(enemyOne)
	var enemyTwo = enemy2.instantiate()
	enemyTwo.global_position.x = my_random_number_x5
	enemyTwo.global_position.y = my_random_number_y5
	add_child(enemyTwo)
	var blueTee = blueT1.instantiate()
	blueTee.global_position.x = my_random_number_x6
	blueTee.global_position.y = my_random_number_y6
	add_child(blueTee)
	#var blue2 = bcross1.instantiate()
	#blue2.global_position.x = my_random_number_x8
	#blue2.global_position.y = my_random_number_y8
	#add_child(blue2)
	var korner2 = corner1.instantiate()
	korner2.global_position.x = my_random_number_x9
	korner2.global_position.y = my_random_number_y9
	add_child(korner2)
	#give L an R enemies different collision layers and put both in player hutbox? yes, works. current setup
	

func _death_display() -> void:
	#timerDisplay.text = "[center]" +str(timerStart) + " x " + str(stats.score)
	deathDisplayTimer.start(0.0)
	multiTimer.start(0.0)

func _on_energy_timer_1_timeout() -> void:
	var energy1 = nrg1.instantiate()
	var my_random_number_x = rng.randf_range(248.0, 720.0)
	var my_random_number_y = rng.randf_range(-175.0, 65.0)
	energy1.global_position.x = my_random_number_x
	energy1.global_position.y = my_random_number_y
	add_child(energy1)
	#print_debug("nrg1")


func _on_game_timer_1_timeout() -> void:
	timerStart += 1


func _on_game_timer_2_timeout() -> void:
	if timerStart2 >= 100:
		timerStart2 = 0


func _on_energy_timer_2_timeout() -> void:
	var energy2 = nrg2.instantiate()
	var my_random_number_x = rng.randf_range(248.0, 720.0)
	var my_random_number_y = rng.randf_range(-175.0, 65.0)
	energy2.global_position.x = my_random_number_x
	energy2.global_position.y = my_random_number_y
	add_child(energy2)
	#print_debug("nrg2")


func _on_ready_timer_timeout() -> void:
	
	energyTimer.start(0.0)
	energyTimer2.start(0.0)
	$Timer3.start(0.0)
	
	


func _on_prison_timer_timeout() -> void:
	neonPrison.queue_free()
	timerDisplay3.hide()
	gametimer.start()
	timerDisplay.show()
	timerDisplay2.show()



func _on_start_timer_timeout() -> void:
	ding.play(0.0)
	timerDisplay3.text = "[center][rainbow]" + str(3)
	await get_tree().create_timer(1.0).timeout
	ding.play(0.0)
	timerDisplay3.text = "[center][rainbow]" + str(2)
	await get_tree().create_timer(1.0).timeout
	ding.play(0.0)
	timerDisplay3.text = "[center][rainbow]" + str(1)
	await get_tree().create_timer(1.0).timeout
	ding.play(0.0)
	timerDisplay3.text = "[center][rainbow]" + str(0)


func _on_death_display_timer_timeout() -> void:
	timerDisplay3.text = "[center][rainbow]You're Dead!"
	timerDisplay3.show()
	scoreBoom.frame = 0
	scoreBoom.show()
	scoreBoom.play("default")
	timerDisplay.text = "[center]Score: " + str(stats.score * timerStart)
	scoreDisplay.hide()
	xDisplay.hide()
	scroom.play(0.0)
	overlay.show()
	hbox.show()
	button1.grab_focus()
	timerDisplay.global_position.x = 292


func _on_multiply_timer_timeout() -> void:
	pass#timerDisplay.text = "[center]" +str(timerStart) + "   x "


func _on_score_boom_animation_finished() -> void:
	scoreBoom.hide()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")
	


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
	


func _on_timer_2_timeout() -> void:
	# disperse some additional platforms and enemies here
	#blueCross1
	var my_random_number_x2 = rng.randf_range(950.0, 3500.0)
	var my_random_number_y2 = rng.randf_range(-135.0, 65.0)
	#corner1
	var my_random_number_x3 = rng.randf_range(950.0, 3500.0)
	var my_random_number_y3 = rng.randf_range(-135.0, 65.0)
	#enemy1
	var my_random_number_x4 = rng.randf_range(950.0, 3500.0)
	var my_random_number_y4 = rng.randf_range(-135.0, 65.0)
	#enemy2 L->R
	var my_random_number_x5 = rng.randf_range(-1950.0, -180.0)
	var my_random_number_y5 = rng.randf_range(-135.0, 65.0)
	#longNeon2
	#var my_random_number_x7 = rng.randf_range(3005.0, 8000.0)
	#var my_random_number_y7 = rng.randf_range(-135.0, 65.0)
	
	var blue1 = bcross1.instantiate()
	blue1.global_position.x = my_random_number_x2
	blue1.global_position.y = my_random_number_y2
	add_child(blue1)
	var korner1 = corner1.instantiate()
	korner1.global_position.x = my_random_number_x3
	korner1.global_position.y = my_random_number_y3
	add_child(korner1)
	var enemyOne = enemy1.instantiate()
	enemyOne.global_position.x = my_random_number_x4
	enemyOne.global_position.y = my_random_number_y4
	add_child(enemyOne)
	var enemyTwo = enemy2.instantiate()
	enemyTwo.global_position.x = my_random_number_x5
	enemyTwo.global_position.y = my_random_number_y5
	add_child(enemyTwo)
	#var longNeon2 = long1.instantiate()
	#longNeon2.global_position.x = my_random_number_x7
	#longNeon2.global_position.y = my_random_number_y7
	#add_child(longNeon2)
	
	
	


func _on_timer_3_timeout() -> void:
	var my_random_number_x = rng.randf_range(950.0, 1350.0)
	var my_random_number_y = rng.randf_range(-65.0, 65.0)
	
	var shortNeon = short1.instantiate()
	shortNeon.global_position.x = my_random_number_x
	shortNeon.global_position.y = my_random_number_y
	add_child(shortNeon)
