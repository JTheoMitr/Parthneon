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
@onready var g_tracking = GlobalTracking
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
@onready var uiLayer = $CanvasLayer
@onready var nightSky = $NightSky
@onready var nightSky2 = $NightSky2
@onready var xDisplay = $XDisplay
@onready var timer = $Timer
@onready var timer2 = $Timer2
@onready var timer3 = $Timer3
@onready var lowPlatTimer = $LowPlatformTimer
@onready var bossPrepTimer = $BossPrepTimer
@onready var bossCompletedTimer = $BossCompletedTimer
@onready var bossTimer = $BossTimer
@onready var satTimer = $SatelliteTimer
@onready var floorsplosion = $Floorsplosion1
@onready var floorsplosionTimer = $FloorsplosionTimer
@onready var flspr1 = $FLSPSound1
@onready var flspr2 = $FLSPSound2
@onready var pauseMenu = $PauseMenu
@onready var planetTimer = $PlanetTimer
@onready var lrgPlanetTimer = $LrgPlanetTimer
@onready var commsTimer = $CommsTimer
@onready var enemyTimer = $EnemyTimer
@onready var enemyTimer2 = $EnemyTimer2
@onready var bossDefeatedTimer = $BossDefeatedTimer
@onready var clearTimer = $ClearTimer
@onready var droneTimer = $DroneTimer
@onready var gemsTimer = $GemsTimer
@onready var alienTimer = $AlienTimer

var rng = RandomNumberGenerator.new()
var breathing

var enteredInitials

const InitialsUI = preload("res://initial_entry_ui.tscn")
const LeaderboardUI = preload("res://ui/Leaderboard.tscn")

#platforms and basic enemies
var long1 = preload("res://platforms/platform_neon_long_one_horiz.tscn")
var short1 = preload("res://platforms/platform_neon_short_one_horiz.tscn")
var bcross1 = preload("res://platforms/neon_blue_cross_platform_slippery.tscn")
var nrg1 = preload("res://items/energy_points_1.tscn")
var nrg2 = preload("res://items/energy_points_2.tscn")
var corner1 = preload("res://platforms/platform_neon_corner.tscn")
var enemy1 = preload("res://enemies/neon_bot_enemy1.tscn")
var enemy2 = preload("res://enemies/neon_bot_enemy2.tscn")
var blueT1 = preload("res://platforms/platform_neon_T_blue.tscn")
var longAndLow1 = preload("res://platforms/platform_neon_longandlow_one_horiz.tscn")

var alienEnemy1 = preload("res://enemies/alien_enemy1.tscn")

#bosses
var smiley1 = preload("res://enemies/smiley_drone_boss.tscn")
var boot1 = preload("res://enemies/boot_drone_boss.tscn")
var mech1 = preload("res://enemies/mech_boss_1.tscn")
var spaceLab1 = preload("res://platforms/space_lab_section_1.tscn")
var gun1 = preload("res://enemies/gun_drone_boss.tscn")

#planets n galaxies
var planet1medspin = preload("res://level/planet_1_medium_spinning.tscn")
var planet2medspin = preload("res://level/planet_2_medium_spinning.tscn")
var planet3medspin = preload("res://level/planet_3_medium_spinning.tscn")
var planet4medspin = preload("res://level/planet_4_medium_spinning.tscn")
var planet5medspin = preload("res://level/planet_4_medium_spinning.tscn")
var planet5smallspin = preload("res://level/planet_5_small_spinning.tscn")
var planet6smallspin = preload("res://level/planet_6_small_spinning.tscn")

var galaxy1 = preload("res://level/galaxy_1_anim.tscn")

#satellites
var sat1 = preload("res://level/satellite_1_spinning.tscn")

#comss Uis
var comms1 = preload("res://ui/comms_ui_1.tscn")
var comms2 = preload("res://ui/comms_ui_2.tscn")
var commsMech1 = preload("res://ui/comms_ui_mech_1.tscn")

#drones
var drones = preload("res://ui/drone_deploy_1.tscn")

var planet1lrg = preload("res://level/planet_1_large.tscn")

var leaderboard_ui = LeaderboardUI.instantiate()

var timerStart
var timerStart2
var timeScroll
var scoreFontSize

var bosses
var bossCount
var satellites
var satelliteCount
var planets
var lrgPlanets
var screen_size
var paused

#@onready var entry_ui = $InitialEntryUI

func _ready():
	#droneTimer.start() #testing, remove this after
	Leaderboard.connect("score_submitted", Callable(self, "_show_leaderboard"))
	#entry_ui.connect("initials_entered", Callable(self, "_on_initials_entered"))
	g_tracking.connect("boss_1_defeated", Callable(self, "_boss_1_defeated"))
	g_tracking.connect("space_lab_entered", Callable(self, "_entering_space_lab"))
	g_tracking.connect("timers_startup", Callable(self, "_timers_go"))
	
	screen_size = get_viewport().get_visible_rect().size
	
	bossCount = 0
	satelliteCount = 0
	satellites = [sat1]
	bosses = [mech1, spaceLab1, gun1, smiley1, boot1, gun1, smiley1, boot1, gun1, smiley1, boot1, gun1, smiley1]
	planets = [planet1medspin, galaxy1, planet2medspin, planet3medspin, planet4medspin, planet5medspin, planet5smallspin, planet6smallspin]
	lrgPlanets = [planet1lrg, planet1lrg]
	stats.bossPhase = false
	
	timerStart = 0
	timerStart2 = 0
	timeScroll = false
	
	scoreFontSize = 250
	
	enemyTimer.start()
	
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
	
	# Add leaderboard as a modal overlay
	uiLayer.add_child(leaderboard_ui)
	leaderboard_ui.visible = false

	
	await get_tree().create_timer(1.0).timeout
	timerDisplay3.show()
	$GetReady.play(0.0)
	$NightSky.play()
	breathing = true
	scoreBoom.hide()
	overlay.hide()

	pv1.speed = 1
	pv2.speed = 1
	floorsplosion.hide()

	stats.alive = true
	stats.score = 0
	stats.health = 1
	#print_debug("readying up")
	#print_debug(timerDisplay.global_position.x)
	
	stats.connect("_game_unpaused", _unpause)
	paused = false
	pauseMenu.hide()
	
	#planets
	planetTimer.start(0.0)
	lrgPlanetTimer.start(0.0)
	
	var randomNumber = rng.randf_range(0,5)
	#print_debug(randomNumber)
	var planetOne = planets[randomNumber].instantiate()
	var my_random_number_x = rng.randf_range(1000.0, 1200.0)
	var my_random_number_y = rng.randf_range(-135.0, 65.0)
	planetOne.global_position.x = my_random_number_x
	planetOne.global_position.y = my_random_number_y
	add_child(planetOne)
	
	
	
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("pause"):
		if paused == false:
			paused = true
	
	#nightsky background mvmt
	nightSky.global_position.x -= .13 #original demo speed is .08
	nightSky2.global_position.x -= .13 #original demo speed is .08
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
		
	
	if paused:
		get_tree().paused = true
		pauseMenu.show()
		$PauseMenu/VBoxContainer/Resume.grab_focus()
		
	else:
		get_tree().paused = false
	
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
	#print_debug("timer1up")
	#Timer1: 14 Seconds, 4 platforms
	#Timer2: 7 seconds, 3 platforms
	#Timer3: 3.5 Seconds, 1 Platform, short neon platform
	#use various timers to instance different platform types with various speeds and starting positions
	#longNeon1
	var my_random_number_x = rng.randf_range(2550.0, 5000.0)
	var my_random_number_y = rng.randf_range(-135.0, 65.0)
	#blueCross1
	var my_random_number_x2 = rng.randf_range(1950.0, 3500.0)
	var my_random_number_y2 = rng.randf_range(-135.0, 65.0)
	#corner1
	var my_random_number_x3 = rng.randf_range(2950.0, 3500.0)
	var my_random_number_y3 = rng.randf_range(-135.0, 65.0)
	#bluetee
	var my_random_number_x6 = rng.randf_range(1250.0, 2570.0)
	var my_random_number_y6 = rng.randf_range(-135.0, 65.0)
	#blueCross2
	#var my_random_number_x8 = rng.randf_range(3505.0, 5500.0)
	#var my_random_number_y8 = rng.randf_range(-135.0, 65.0)
	#corner2
	#var my_random_number_x9 = rng.randf_range(3500.0, 5500.0)
	#var my_random_number_y9 = rng.randf_range(-135.0, 65.0)
	
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
	
	var blueTee = blueT1.instantiate()
	blueTee.global_position.x = my_random_number_x6
	blueTee.global_position.y = my_random_number_y6
	add_child(blueTee)
	#var blue2 = bcross1.instantiate()
	#blue2.global_position.x = my_random_number_x8
	#blue2.global_position.y = my_random_number_y8
	#add_child(blue2)
	#var korner2 = corner1.instantiate()
	#korner2.global_position.x = my_random_number_x9
	#korner2.global_position.y = my_random_number_y9
	#add_child(korner2)
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
	
	
	enemyTimer2.start()
	
	


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
	
	stats.runScore = (stats.score * timerStart)
	#button1.grab_focus()
	timerDisplay.global_position.x = 292
	
	var initialsEntry = InitialsUI.instantiate()
	uiLayer.add_child(initialsEntry)
#	var viewport_size = get_viewport().get_visible_rect().size
#	initialsEntry.position = viewport_size / 2
#	initialsEntry.grab_focus()
	


func _on_multiply_timer_timeout() -> void:
	pass#timerDisplay.text = "[center]" +str(timerStart) + "   x "


func _on_score_boom_animation_finished() -> void:
	scoreBoom.hide()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")
	


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
	


func _on_timer_2_timeout() -> void:
	#print_debug("timer2up")
	#Timer1: 14 Seconds, 4 platforms
	#Timer2: 7 seconds, 3 platforms
	#Timer3: 3.5 Seconds, 1 Platform, short neon platform
	
	#shortneon
	var my_random_number_x = rng.randf_range(1250.0, 1350.0)
	var my_random_number_y = rng.randf_range(-65.0, 65.0)
	#corner1
	var my_random_number_x3 = rng.randf_range(950.0, 3500.0)
	var my_random_number_y3 = rng.randf_range(-135.0, 65.0)
	
	#longNeon2
	#var my_random_number_x7 = rng.randf_range(3005.0, 8000.0)
	#var my_random_number_y7 = rng.randf_range(-135.0, 65.0)
	
	var shortNeon = short1.instantiate()
	shortNeon.global_position.x = my_random_number_x
	shortNeon.global_position.y = my_random_number_y
	add_child(shortNeon)
	var korner1 = corner1.instantiate()
	korner1.global_position.x = my_random_number_x3
	korner1.global_position.y = my_random_number_y3
	add_child(korner1)

	#var longNeon2 = long1.instantiate()
	#longNeon2.global_position.x = my_random_number_x7
	#longNeon2.global_position.y = my_random_number_y7
	#add_child(longNeon2)
	
	
	


func _on_timer_3_timeout() -> void:
	#print_debug("timer3up")
	#Timer1: 14 Seconds, 5 platforms, 2 enemies
	#Timer2: 7 seconds, 2 platforms, 2 enemies
	#Timer3: 3.5 Seconds, 1 Object, short platform
	var my_random_number_x = rng.randf_range(950.0, 1150.0)
	var my_random_number_y = rng.randf_range(-65.0, 65.0)
	
	var my_random_number_x2 = rng.randf_range(1150.0, 2150.0)
	var my_random_number_y2 = rng.randf_range(-65.0, 65.0)
	
	var shortNeon = short1.instantiate()
	shortNeon.global_position.x = my_random_number_x
	shortNeon.global_position.y = my_random_number_y
	add_child(shortNeon)
	
	var shortNeon2 = short1.instantiate()
	shortNeon.global_position.x = my_random_number_x2
	shortNeon.global_position.y = my_random_number_y2
	add_child(shortNeon2)


func _on_boss_timer_timeout() -> void:
	#right now this creates a smiley every time, will be replaced with an array of bosses to iterate through
	var my_random_number_x = rng.randf_range(1000.0, 1001.0)
	var my_random_number_y = rng.randf_range(-75.0, -75.0)
	
	var currentBoss = bosses[bossCount].instantiate()
	print_debug(currentBoss.name)
	#adjust global starting point depending on which boss, og timer was 67 seconds, now 15
	if currentBoss.name == 'MechBossOne':
		print("its the mech")
		currentBoss.global_position.x = 800 #save this above as a var 
		currentBoss.global_position.y = 350
	elif currentBoss.name == 'SpaceLab1':
		print("space lab...in space!")
		currentBoss.global_position.x = 1500 #save this above as a var 
		currentBoss.global_position.y = 90
	else :
		currentBoss.global_position.x = my_random_number_x
		currentBoss.global_position.y = my_random_number_y
	add_child(currentBoss)
	#boss should have a separate layer for damage (7) vs basic enemies (5 and 6). hurtbox should register
	
	bossCompletedTimer.start(0.0)
	
	
	


func _on_low_platform_timer_timeout() -> void:
	var my_random_number_x = rng.randf_range(850.0, 850.0)
	var my_random_number_y = rng.randf_range(70.0, 70.0)
	
	var longNeon1 = longAndLow1.instantiate()
	longNeon1.global_position.x = my_random_number_x
	longNeon1.global_position.y = my_random_number_y
	add_child(longNeon1)
	#print_debug("lowplatd")


func _on_boss_prep_timer_timeout() -> void:
	#change direction of all platforms that are not the most basic design to clear screen for boss. will need to revert to false once boss phase is complete.
	stats.bossPhase = true
	#stop creating new platforms and enemies for boss phase, will need to start these up again after boss phase is over
	#timer.stop()
	#timer2.stop()
	#timer3.stop()
	#creating a run of low plats to use during fight, will need to stop this timer at the end of the fight, as well
	#lowPlatTimer.start(0.0)
	#floorsplosionTimer.start(0.0)
	enemyTimer.start()
	enemyTimer2.start()
	#print_debug("bosspreppd")
	#map out all timers / triggers as a flow chart in your book


func _on_boss_completed_timer_timeout() -> void:
	timer.start()
	timer2.start()
	#timer3.start()
	stats.bossPhase = false
	lowPlatTimer.stop()
	#print_debug("completed")
	bossCount += 1
	#re-start boss prep and boss entrance
	bossPrepTimer.start(0.0)
	bossTimer.start(0.0)
	clearTimer.start() #might remove this


func _on_floorsplosion_1_animation_finished() -> void:
	floorsplosion.hide()
	floorsplosion.stop()


func _on_floorsplosion_timer_timeout() -> void:
	floorsplosion.show()
	floorsplosion.frame = 0
	floorsplosion.play("default")
	flspr1.play()
	flspr2.play()
	#add a cool sound! more sounds!

func _unpause():
	paused = false
	


func _on_planet_timer_timeout() -> void:
	#randomize from a list of small and medium planets, create a second timer for the large planets with a lower y (more of a close-to-the-surface effect) and go from there.
	var randomNumber = rng.randf_range(0,7)
	#print_debug(randomNumber)
	var planetOne = planets[randomNumber].instantiate()
	var my_random_number_x = rng.randf_range(1000.0, 1200.0)
	var my_random_number_y = rng.randf_range(-135.0, 65.0)
	planetOne.global_position.x = my_random_number_x
	planetOne.global_position.y = my_random_number_y
	add_child(planetOne)


func _on_lrg_planet_timer_timeout() -> void:
	pass
	#var randomNumber = rng.randf_range(0,1)
	#var planetOne = lrgPlanets[randomNumber].instantiate()
	#var my_random_number_x = rng.randf_range(1000.0, 1200.0)
	#var my_random_number_y = rng.randf_range(190.0, 205.0)
	#planetOne.global_position.x = my_random_number_x
	#planetOne.global_position.y = my_random_number_y
	#add_child(planetOne)

func _show_leaderboard() -> void:
	# Load leaderboard UI scene
	#var leaderboard_ui = preload("res://ui/Leaderboard.tscn").instantiate()
	print_debug("score submitted!")
	leaderboard_ui.visible = true


	# Ask it to populate with latest scores
	#leaderboard_ui.load_scores()


#func _on_button_4_pressed() -> void:
	#Leaderboard.submit_score("parthneon_leaderboard_local", enteredInitials, (stats.score * timerStart))
	#Leaderboard.get_top_scores("parthneon_leaderboard_local")


func _on_satellite_timer_timeout() -> void:
	var launchPad = satellites[satelliteCount].instantiate()
	launchPad.global_position.x = 900
	launchPad.global_position.y = -65
	add_child(launchPad)
	
	lowPlatTimer.start(0.0)
	floorsplosionTimer.start(0.0)
	
	
	


func _on_comms_timer_timeout() -> void:
	print_debug("comms1")
	print_debug(screen_size)
	var commsPart1 = comms1.instantiate()
	commsPart1.global_position.x = 350
	commsPart1.global_position.y = 15
	add_child(commsPart1)
	


func _on_enemy_timer_timeout() -> void:
	#5 seconds
	#enemy1
	var my_random_number_x4 = rng.randf_range(1950.0, 2500.0)
	var my_random_number_y4 = rng.randf_range(-135.0, 65.0)
	var enemyOne = enemy1.instantiate()
	enemyOne.global_position.x = my_random_number_x4
	enemyOne.global_position.y = my_random_number_y4
	add_child(enemyOne)
	


func _on_enemy_timer_2_timeout() -> void:
	
	#15 seconds
	#enemy2 L->R
	var my_random_number_x5 = rng.randf_range(-1950.0, -180.0)
	var my_random_number_y5 = rng.randf_range(-135.0, 65.0)
	var enemyTwo = enemy2.instantiate()
	enemyTwo.global_position.x = my_random_number_x5
	enemyTwo.global_position.y = my_random_number_y5
	add_child(enemyTwo)


func _on_boss_defeated_timer_timeout() -> void:
	print_debug("comms2")
	print_debug(screen_size)
	var commsPart2 = comms2.instantiate()
	commsPart2.global_position.x = 350
	commsPart2.global_position.y = 15
	add_child(commsPart2)
	droneTimer.start()
	
func _boss_1_defeated() -> void:
	bossDefeatedTimer.start()
	var commsMechDefeated = commsMech1.instantiate()
	commsMechDefeated.global_position.x = 550
	commsMechDefeated.global_position.y = -135
	add_child(commsMechDefeated)


func _on_clear_timer_timeout() -> void:
	
	timer.stop()
	timer2.stop()
	enemyTimer.stop()
	enemyTimer2.stop()


func _on_drone_timer_timeout() -> void:
	var droneDeploy = drones.instantiate()
	droneDeploy.global_position.x = 300
	droneDeploy.global_position.y = -150
	add_child(droneDeploy)
	print_debug("drones deployed")
	
func _entering_space_lab() -> void:
	gemsTimer.start()
	timer.stop()
	timer2.stop()
	timer3.stop()
	enemyTimer.stop()
	enemyTimer2.stop()
	lowPlatTimer.stop()
	alienTimer.start()
	var nodes_to_clear = get_tree().get_nodes_in_group("cleanup_on_lab_enter")
	for n in nodes_to_clear:
		if is_instance_valid(n):
			n.queue_free()
	
func _timers_go() -> void:
	timer.start()
	timer2.start()
	timer3.start()
	enemyTimer.start()
	enemyTimer2.start()
	lowPlatTimer.start()
	gemsTimer.stop()
	alienTimer.stop()


func _on_gems_timer_timeout() -> void:
	var energy1 = nrg1.instantiate()
	var my_random_number_x = rng.randf_range(248.0, 720.0)
	var my_random_number_y = rng.randf_range(-175.0, 65.0)
	energy1.global_position.x = my_random_number_x
	energy1.global_position.y = my_random_number_y
	add_child(energy1)
	#print_debug("nrg1")
	var energy2 = nrg2.instantiate()
	var my_random_number_x2 = rng.randf_range(248.0, 720.0)
	var my_random_number_y2 = rng.randf_range(-175.0, 65.0)
	energy2.global_position.x = my_random_number_x2
	energy2.global_position.y = my_random_number_y2
	add_child(energy2)
	#print_debug("nrg2")


func _on_alien_timer_timeout() -> void:
	var my_random_number_x4 = rng.randf_range(1950.0, 2500.0)
	var my_random_number_y4 = rng.randf_range(-135.0, 65.0)
	var enemyOne = alienEnemy1.instantiate()
	enemyOne.global_position.x = my_random_number_x4
	enemyOne.global_position.y = my_random_number_y4
	add_child(enemyOne)
