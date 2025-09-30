extends Area2D

@onready var text = $Panel/RichTextLabel
@onready var wordTimer = $Timer
@onready var chatter = $AudioStreamPlayer

var letterCount


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	letterCount = 0
	wordTimer.start()
	chatter.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
			text.text = "[center]Well Done, sir"
		13:
			text.text = "[center]Well Done, sir"
		14:
			text.text = "[center]Well Done, sir"
		15:
			text.text = "[center]Well Done, sir"
		16:
			text.text = "[center]Well Done, sir"
		17:
			text.text = "[center]Well Done, sir"
		18:
			text.text = "[center]Well Done, sir"
		19:
			text.text = "[center]Well Done, sir"
		20:
			text.text = "[center]I"
		21:
			text.text = "[center]I'"
		22:
			text.text = "[center]I'm "
		23:
			text.text = "[center]I'm g"
		24:
			text.text = "[center]I'm ge"
		25:
			text.text = "[center]I'm get"
		26:
			text.text = "[center]I'm gett"
		27:
			text.text = "[center]I'm getti"
		28:
			text.text = "[center]I'm gettin"
		29:
			text.text = "[center]I'm getting"
		30:
			text.text = "[center]I'm getting s"
		31:
			text.text = "[center]I'm getting so"
		32:
			text.text = "[center]I'm getting som"
		33:
			text.text = "[center]I'm getting some"
		34:
			text.text = "[center]I'm getting somet"
		35:
			text.text = "[center]I'm getting someth"
		36:
			text.text = "[center]I'm getting somethi"
		37:
			text.text = "[center]I'm getting somethin"
		38:
			text.text = "[center]I'm getting something"
		39:
			text.text = "[center]I'm getting something b"
		40:
			text.text = "[center]I'm getting something bi"
		41:
			text.text = "[center]I'm getting something big"
		42:
			text.text = "[center]I'm getting something big o"
		43:
			text.text = "[center]I'm getting something big on"
		44:
			text.text = "[center]I'm getting something big on t"
		45:
			text.text = "[center]I'm getting something big on th"
		46:
			text.text = "[center]I'm getting something big on the"
		47:
			text.text = "[center]I'm getting something big on the r"
		48:
			text.text = "[center]I'm getting something big on the ra"
		49:
			text.text = "[center]I'm getting something big on the rad"
		50:
			text.text = "[center]I'm getting something big on the rada"
		51:
			text.text = "[center]I'm getting something big on the radar"
		52:
			text.text = "[center]I'm getting something big on the radar."
		53:
			text.text = "[center]I'm getting something big on the radar."
		54:
			text.text = "[center]I'm getting something big on the radar."
		55:
			text.text = "[center]I'm getting something big on the radar."
		56:
			text.text = "[center]Looks like a derelicte station... be careful"
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
			self.queue_free()
			
func _on_timer_timeout() -> void:
	letterCount += 1
