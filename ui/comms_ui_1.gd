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
	#how to make it expand from a scaled down version? then contract to disappear


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if scalingUp && self.scale.x < .25:
		self.scale.x += .005
		self.scale.y += .005
		
	if scalingDown && self.scale.y > -.01:
		self.scale.x -= .005
		self.scale.y -= .005
		
	if self.scale.x <= 0:
		self.queue_free()
		
	
	match int(letterCount):
		1:
			text.text = "[center]H"
		2:
			text.text = "[center]He"
			
		3:
			text.text = "[center]Hea"
		4:
			text.text = "[center]Heads"
		5:
			text.text = "[center]Heads u"
		6:
			text.text = "[center]Heads up"
		7:
			text.text = "[center]Heads up,"
		8:
			text.text = "[center]Heads up, c"
		9:
			text.text = "[center]Heads up, ca"
		10:
			text.text = "[center]Heads up, cap"
		11:
			text.text = "[center]Heads up, cap"
		12:
			text.text = "[center]Heads up, cap"
		13:
			text.text = "[center]Heads up, cap"
		14:
			text.text = "[center]Heads up, cap"
		15:
			text.text = "[center]Heads up, cap"
		16:
			text.text = "[center]Heads up, cap."
		17:
			text.text = "[center]Heads up, cap.."
		18:
			text.text = "[center]Heads up, cap..."
		19:
			text.text = "[center]Heads up, cap..."
		20:
			text.text = "[center]L"
		21:
			text.text = "[center]Lo"
		22:
			text.text = "[center]Loo"
		23:
			text.text = "[center]Look"
		24:
			text.text = "[center]Looks"
		25:
			text.text = "[center]Looks L"
		26:
			text.text = "[center]Looks Li"
		27:
			text.text = "[center]Looks Lik"
		28:
			text.text = "[center]Looks Like"
		29:
			text.text = "[center]Looks Like U"
		30:
			text.text = "[center]Looks Like UA"
		31:
			text.text = "[center]Looks Like UAX"
		32:
			text.text = "[center]Looks Like UAX j"
		33:
			text.text = "[center]Looks Like UAX ju"
		34:
			text.text = "[center]Looks Like UAX jus"
		35:
			text.text = "[center]Looks Like UAX just"
		36:
			text.text = "[center]Looks Like UAX just l"
		37:
			text.text = "[center]Looks Like UAX just la"
		38:
			text.text = "[center]Looks Like UAX just lau"
		39:
			text.text = "[center]Looks Like UAX just laun"
		40:
			text.text = "[center]Looks Like UAX just launc"
		41:
			text.text = "[center]Looks Like UAX just launch"
		42:
			text.text = "[center]Looks Like UAX just launche"
		43:
			text.text = "[center]Looks Like UAX just launched"
		44:
			text.text = "[center]Looks Like UAX just launched \n a h"
		45:
			text.text = "[center]Looks Like UAX just launched \n a he"
		46:
			text.text = "[center]Looks Like UAX just launched \n a hea"
		47:
			text.text = "[center]Looks Like UAX just launched \n a heav"
		48:
			text.text = "[center]Looks Like UAX just launched \n a heavy"
		49:
			text.text = "[center]Looks Like UAX just launched \n a heavy m"
		50:
			text.text = "[center]Looks Like UAX just launched \n a heavy me"
		51:
			text.text = "[center]Looks Like UAX just launched \n a heavy mec"
		52:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech"
		53:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech i"
		54:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech in"
		55:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech int"
		56:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into"
		57:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into o"
		58:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into or"
		59:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orb"
		60:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orbi"
		61:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orbit"
		62:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orbit"
		63:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orbit"
		64:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orbit"
		65:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orbit"
		66:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orbit"
		67:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orbit"
		68:
			text.text = "[center]Looks Like UAX just launched \n a heavy mech into orbit"
		76:
			wordTimer.stop()
			scalingDown = true
			scalingUp = false
			
func _on_timer_timeout() -> void:
	letterCount += 1
	
	if letterCount == 1:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
	
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
	
	if letterCount == 65:
		wordTimer.stop()
		await get_tree().create_timer(1.0).timeout
		wordTimer.start()
