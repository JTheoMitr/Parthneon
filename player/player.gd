class_name Player
extends CharacterBody2D

# Keep this in sync with the AnimationTree's state names.
const States = {
	IDLE = "idle",
	WALK = "walk",
	RUN = "run",
	FLY = "fly",
	FALL = "fall",
}

var stats = PlayerStats

const WALK_SPEED = 200.0
const ACCELERATION_SPEED = WALK_SPEED * 6.0
const JUMP_VELOCITY = -400.0
## Maximum speed at which the player can fall.
const TERMINAL_VELOCITY = 400

var falling_slow = false
var falling_fast = false
var no_move_horizontal_time = 0.0
var flashing
var alive

@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $Sprite2D
@onready var sprite_scale = sprite.scale.x
@onready var blockFlash = $BlockFlash
@onready var flashSound = $FlashSound
@onready var jumpSound = $JumpSound
@onready var dust = $Dust
@onready var sprinkle = $Sprinkle
@onready var hurtbox = $Hurtbox
@onready var area2d = $Area2D


func _ready():
	$AnimationTree.active = true
	blockFlash.hide()
	dust.stop()
	dust.hide()
	flashing = false
	alive = true
	stats.health = 1
	sprinkle.hide()


func _physics_process(delta: float) -> void:
	
	var is_jumping = false
	if Input.is_action_just_pressed("jump"):
		is_jumping = try_jump()
	elif Input.is_action_just_released("jump") and velocity.y < 0.0:
		# The player let go of jump early, reduce vertical momentum.
		velocity.y *= 0.6
	# Fall.
	velocity.y = minf(TERMINAL_VELOCITY, velocity.y + gravity * delta)

	var direction := Input.get_axis("move_left", "move_right") * WALK_SPEED
	velocity.x = move_toward(velocity.x, direction, ACCELERATION_SPEED * delta)
	
	if Input.is_action_just_pressed("ui_down") || Input.is_action_just_pressed("flash"):
		$CollisionShape2D.disabled = true
		blockFlash.show()
		blockFlash.frame = 0
		blockFlash.play("default")
		flashSound.play(0.0)
		flashing = true
		
	if Input.is_action_just_released("ui_down") || Input.is_action_just_released("flash"):
		$CollisionShape2D.disabled = false
	
	if no_move_horizontal_time > 0.0:
		# After doing a hard fall, don't move for a short time.
		velocity.x = 0.0
		no_move_horizontal_time -= delta

	if not is_zero_approx(velocity.x):
		if velocity.x > 0.0:
			sprite.scale.x = 1.0 * sprite_scale
		else:
			sprite.scale.x = -1.0 * sprite_scale

	move_and_slide()

	# After applying our motion, update our animation to match.

	# Calculate falling speed for animation purposes.
	if velocity.y >= TERMINAL_VELOCITY:
		falling_fast = true
		falling_slow = false
	elif velocity.y > 300:
		falling_slow = true

	if is_jumping:
		$AnimationTree["parameters/jump/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE

	if is_on_floor():
		# Most animations change when we run, land, or take off.
		# add pixel dust to landing anims
		if falling_fast:
			$AnimationTree["parameters/land_hard/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
			no_move_horizontal_time = 0.4
			dust.show()
			dust.play("default")
		elif falling_slow:
			$AnimationTree["parameters/land/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
			dust.show()
			dust.play("default")
			
		if abs(velocity.x) > 50:
			$AnimationTree["parameters/state/transition_request"] = States.RUN
			$AnimationTree["parameters/run_timescale/scale"] = abs(velocity.x) / 60
		elif velocity.x:
			$AnimationTree["parameters/state/transition_request"] = States.WALK
			$AnimationTree["parameters/walk_timescale/scale"] = abs(velocity.x) / 12
		else:
			$AnimationTree["parameters/state/transition_request"] = States.IDLE

		falling_fast = false
		falling_slow = false
	else:
		if velocity.y > 0:
			$AnimationTree["parameters/state/transition_request"] = States.FALL
		else:
			$AnimationTree["parameters/state/transition_request"] = States.FLY

	if stats.health <= 0:
		if alive:
			#print_debug("YOU DEAD")
			sprite.hide()
			sprinkle.show()
			sprinkle.play("default")
			
		alive = false

func try_jump() -> bool:
	#add another check here for a double jump? create a djump var and allow another jump before disabling
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumpSound.play(0.0)
		return true
	return false


func _on_block_flash_animation_finished() -> void:
	blockFlash.hide()
	blockFlash.stop()
	flashing = false
	#print_debug("dance")


func _on_dust_animation_finished() -> void:
	dust.hide()
	dust.stop()


func _on_hurtbox_area_entered(_area: Area2D) -> void:
	if flashing:
		#print_debug("flashed")
		velocity.y = JUMP_VELOCITY
		jumpSound.play(0.0)
	else:
		#print_debug("hurt")
		stats.health -= 1
		
		


func _on_sprinkle_animation_finished() -> void:
	stats.alive = false
	sprinkle.hide()
	area2d.monitorable = false
	area2d.monitoring = false
	hurtbox.monitorable = false
	hurtbox.monitoring = false
	
	
	#queue free(?) the player and show the death alert, which displays the score, and gives the player to quit or retry. at this point, if the player is connected, the score should be sent up to the high score list and saved
