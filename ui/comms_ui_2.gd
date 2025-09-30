extends Area2D

@onready var text = $Panel/RichTextLabel
@onready var wordTimer = $Timer
@onready var chatter = $AudioStreamPlayer

var letterCount
var scalingUp
var scalingDown


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	letterCount = 0
	wordTimer.start()
	chatter.play()
	self.scale.x = .01
	self.scale.y = .01
	scalingUp = true
	scalingDown = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if scalingUp && self.scale.x < .25:
		self.scale.x += .01
		self.scale.y += .01
		
	if scalingDown && self.scale.y > -.01:
		self.scale.x -= .01
		self.scale.y -= .01
		
	if self.scale.x <= 0:
		self.queue_free()
	match int(letterCount):
		1:
			text.text = "[center]W"
		2:
			text.text = "[center]We"
		3:
			text.text = "[center]Wel"
		4:
			text.text = "[center]Well"
		5:
			text.text = "[center]Well D"
		6:
			text.text = "[center]Well Do"
		7:
			text.text = "[center]Well Don"
		8:
			text.text = "[center]Well Done"
		9:
			text.text = "[center]Well Done, "
		10:
			text.text = "[center]Well Done, s"
		11:
			text.text = "[center]Well Done, sir"
		12:
			text.text = "[center]Well Done, sir."
		13:
			text.text = "[center]Well Done, sir."
		14:
			text.text = "[center]Well Done, sir.."
		15:
			text.text = "[center]Well Done, sir..."
		16:
			text.text = "[center]Well Done, sir..."
		17:
			text.text = "[center]Well Done, sir..."
		18:
			text.text = "[center]Well Done, sir..."
		19:
			text.text = "[center]Well Done, sir..."
		20:
			text.text = "[center]I"
		21:
			text.text = "[center]I'"
		22:
			text.text = "[center]I'l "
		23:
			text.text = "[center]I'l"
		24:
			text.text = "[center]I'll s"
		25:
			text.text = "[center]I'll se"
		26:
			text.text = "[center]I'll sen"
		27:
			text.text = "[center]I'll send"
		28:
			text.text = "[center]I'll send t"
		29:
			text.text = "[center]I'll send th"
		30:
			text.text = "[center]I'll send the "
		31:
			text.text = "[center]I'll send the d"
		32:
			text.text = "[center]I'll send the dr"
		33:
			text.text = "[center]I'll send the dro"
		34:
			text.text = "[center]I'll send the dron"
		35:
			text.text = "[center]I'll send the drone"
		36:
			text.text = "[center]I'll send the drones"
		37:
			text.text = "[center]I'll send the drones \n d"
		38:
			text.text = "[center]I'll send the drones \n do"
		39:
			text.text = "[center]I'll send the drones \n dow"
		40:
			text.text = "[center]I'll send the drones \n down"
		41:
			text.text = "[center]I'll send the drones \n down f"
		42:
			text.text = "[center]I'll send the drones \n down fo"
		43:
			text.text = "[center]I'll send the drones \n down for "
		44:
			text.text = "[center]I'll send the drones \n down for s"
		45:
			text.text = "[center]I'll send the drones \n down for sc"
		46:
			text.text = "[center]I'll send the drones \n down for scr"
		47:
			text.text = "[center]I'll send the drones \n down for scra"
		48:
			text.text = "[center]I'll send the drones \n down for scrap"
		49:
			text.text = "[center]I'll send the drones \n down for scrap."
		50:
			text.text = "[center]I'll send the drones \n down for scrap."
		51:
			text.text = "[center]I'll send the drones \n down for scrap."
		52:
			text.text = "[center]I'll send the drones \n down for scrap."
		53:
			text.text = "[center]I'll send the drones \n down for scrap."
		54:
			text.text = "[center]I'll send the drones \n down for scrap."
		55:
			text.text = "[center]I'll send the drones \n down for scrap."
		56:
			text.text = "[center]I'll send the drones \n down for scrap."
		57:
			text.text = "[center]I'll send the drones \n down for scrap."
		58:
			wordTimer.stop()
			scalingUp = false
			scalingDown = true
		
func _on_timer_timeout() -> void:
	letterCount += 1
	
	if letterCount == 0:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
	
	if letterCount == 13:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
		
	if letterCount == 14:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
		
	if letterCount == 15:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
