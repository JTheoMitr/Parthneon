extends Area2D

@onready var text = $Panel/RichTextLabel
@onready var wordTimer = $Timer
@onready var chatter = $AudioStreamPlayer
@onready var uiChitter = $AudioStreamPlayer2

var letterCount
var scalingUp
var scalingDown


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	letterCount = 0
	wordTimer.start()
	self.scale.x = .01
	self.scale.y = .01
	scalingUp = true
	scalingDown = false
	#how to make it expand from a scaled down version? then contract to disappear


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if scalingUp && self.scale.x < .13:
		self.scale.x += .005
		self.scale.y += .005
		
	if scalingDown && self.scale.y > -.01:
		self.scale.x -= .005
		self.scale.y -= .005
		
	if self.scale.x <= 0:
		self.queue_free()
		
	
	match int(letterCount):
		1:
			text.text = "[center]Security M"
		2:
			text.text = "[center]Security Me"
		3:
			text.text = "[center]Security Mec"
		4:
			text.text = "[center]Security Mech"
		5:
			text.text = "[center]Security Mech D"
		6:
			text.text = "[center]Security Mech De"
			chatter.play()
		7:
			text.text = "[center]Security Mech Des"
		8:
			text.text = "[center]Security Mech Dest"
		9:
			text.text = "[center]Security Mech Destr"
		10:
			text.text = "[center]Security Mech Destro"
		11:
			text.text = "[center]Security Mech Destroy"
		12:
			text.text = "[center]Security Mech Destroye"
		13:
			text.text = "[center]Security Mech Destroyed"
		14:
			text.text = "[center]Security Mech Destroyed"
		15:
			text.text = "[center]Security Mech Destroyed"
		16:
			text.text = "[center]Security Mech Destroyed."
		17:
			text.text = "[center]Security Mech Destroyed.."
		18:
			text.text = "[center]Security Mech Destroyed..."
		19:
			text.text = "[center]Security Mech Destroyed..."
		20:
			text.text = "[center]5"
		21:
			text.text = "[center]50"
		22:
			text.text = "[center]500"
		23:
			text.text = "[center]500 B"
		24:
			text.text = "[center]500 Bo"
		25:
			text.text = "[center]500 Bon"
		26:
			text.text = "[center]500 Bonu"
		27:
			text.text = "[center]500 Bonus"
		28:
			text.text = "[center]500 Bonus X"
		29:
			text.text = "[center]500 Bonus XP"
		30:
			text.text = "[center]500 Bonus XP A"
		31:
			text.text = "[center]500 Bonus XP Aw"
		32:
			text.text = "[center]500 Bonus XP Awa"
		33:
			text.text = "[center]500 Bonus XP Awar"
		34:
			text.text = "[center]500 Bonus XP Award"
		35:
			text.text = "[center]500 Bonus XP Awarde"
		36:
			text.text = "[center]500 Bonus XP Awarded"
		37:
			text.text = "[center]500 Bonus XP Awarded"
		38:
			text.text = "[center]500 Bonus XP Awarded"

		39:
			wordTimer.stop()
			scalingDown = true
			scalingUp = false
			
func _on_timer_timeout() -> void:
	letterCount += 1
	
	if letterCount == 1:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
		uiChitter.play()
	
	if letterCount == 16:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
		
	if letterCount == 17:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
		
	if letterCount == 18:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
	
	if letterCount == 38:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
