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
			text.text = "[center]Y"
		2:
			text.text = "[center]Yo"
		3:
			text.text = "[center]You"
		4:
			text.text = "[center]You g"
		5:
			text.text = "[center]You go"
		6:
			text.text = "[center]You got"
		7:
			text.text = "[center]You got s"
		8:
			text.text = "[center]You got so"
		9:
			text.text = "[center]You got som"
		10:
			text.text = "[center]You got some"
		11:
			text.text = "[center]You got some k"
		12:
			text.text = "[center]You got some ki"
		13:
			text.text = "[center]You got some kin"
		14:
			text.text = "[center]You got some kind"
		15:
			text.text = "[center]You got some kind o"
		16:
			text.text = "[center]You got some kind of"
		17:
			text.text = "[center]You got some kind of d"
		18:
			text.text = "[center]You got some kind of de"
		19:
			text.text = "[center]You got some kind of der"
		20:
			text.text = "[center]You got some kind of dere"
		21:
			text.text = "[center]You got some kind of derel"
		22:
			text.text = "[center]You got some kind of dereli"
		23:
			text.text = "[center]You got some kind of derelic"
		24:
			text.text = "[center]You got some kind of derelict"
		25:
			text.text = "[center]You got some kind of derelicte"
		26:
			text.text = "[center]You got some kind of derelicte \n  s"
		27:
			text.text = "[center]You got some kind of derelicte \n  sp"
		28:
			text.text = "[center]You got some kind of derelicte \n  spa"
		29:
			text.text = "[center]You got some kind of derelicte \n  spac"
		30:
			text.text = "[center]You got some kind of derelicte \n  space"
		31:
			text.text = "[center]You got some kind of derelicte \n  space s"
		32:
			text.text = "[center]You got some kind of derelicte \n  space st"
		33:
			text.text = "[center]You got some kind of derelicte \n  space sta"
		34:
			text.text = "[center]You got some kind of derelicte \n  space stat"
		35:
			text.text = "[center]You got some kind of derelicte \n  space stati"
		36:
			text.text = "[center]You got some kind of derelicte \n  space statio"
		37:
			text.text = "[center]You got some kind of derelicte \n  space station"
		38:
			text.text = "[center]You got some kind of derelicte \n  space station f"
		39:
			text.text = "[center]You got some kind of derelicte \n  space station fl"
		40:
			text.text = "[center]You got some kind of derelicte \n  space station flo"
		41:
			text.text = "[center]You got some kind of derelicte \n  space station floa"
		42:
			text.text = "[center]You got some kind of derelicte \n  space station float"
		43:
			text.text = "[center]You got some kind of derelicte \n  space station floati"
		44:
			text.text = "[center]You got some kind of derelicte \n  space station floatin"
		45:
			text.text = "[center]You got some kind of derelicte \n  space station floating"
		46:
			text.text = "[center]You got some kind of derelicte \n  space station floating y"
		47:
			text.text = "[center]You got some kind of derelicte \n  space station floating yo"
		48:
			text.text = "[center]You got some kind of derelicte \n  space station floating you"
		49:
			text.text = "[center]You got some kind of derelicte \n  space station floating your"
		50:
			text.text = "[center]You got some kind of derelicte \n  space station floating your w"
		51:
			text.text = "[center]You got some kind of derelicte \n  space station floating your wa"
		52:
			text.text = "[center]You got some kind of derelicte \n  space station floating your way"
		53:
			text.text = "[center]E"
		54:
			text.text = "[center]En"
		55:
			text.text = "[center]Ent"
		56:
			text.text = "[center]Ente"
		57:
			text.text = "[center]Enter"
		58:
			text.text = "[center]Enter a"
		59:
			text.text = "[center]Enter at"
		60:
			text.text = "[center]Enter at y"
		61:
			text.text = "[center]Enter at yo"
		62:
			text.text = "[center]Enter at you"
		63:
			text.text = "[center]Enter at your"
		64:
			text.text = "[center]Enter at your o"
		65:
			text.text = "[center]Enter at your ow"
		66:
			text.text = "[center]Enter at your own"
		67:
			text.text = "[center]Enter at your own r"
		68:
			text.text = "[center]Enter at your own ri"
		69:
			text.text = "[center]Enter at your own ris"
		70:
			text.text = "[center]Enter at your own risk"
		71:
			text.text = "[center]Enter at your own risk."
		72:
			text.text = "[center]Enter at your own risk. \n I"
		73:
			text.text = "[center]Enter at your own risk. \n I c"
		74:
			text.text = "[center]Enter at your own risk. \n I ca"
		75:
			text.text = "[center]Enter at your own risk. \n I can"
		76:
			text.text = "[center]Enter at your own risk. \n I can'"
		77:
			text.text = "[center]Enter at your own risk. \n I can't"
		78:
			text.text = "[center]Enter at your own risk. \n I can't t"
		79:
			text.text = "[center]Enter at your own risk. \n I can't tr"
		80:
			text.text = "[center]Enter at your own risk. \n I can't tra"
		81:
			text.text = "[center]Enter at your own risk. \n I can't trac"
		82:
			text.text = "[center]Enter at your own risk. \n I can't track"
		83:
			text.text = "[center]Enter at your own risk. \n I can't track y"
		84:
			text.text = "[center]Enter at your own risk. \n I can't track yo"
		85:
			text.text = "[center]Enter at your own risk. \n I can't track you"
		86:
			text.text = "[center]Enter at your own risk. \n I can't track your"
		87:
			text.text = "[center]Enter at your own risk. \n I can't track your m"
		88:
			text.text = "[center]Enter at your own risk. \n I can't track your mo"
		89:
			text.text = "[center]Enter at your own risk. \n I can't track your mov"
		90:
			text.text = "[center]Enter at your own risk. \n I can't track your move"
		91:
			text.text = "[center]Enter at your own risk. \n I can't track your movem"
		92:
			text.text = "[center]Enter at your own risk. \n I can't track your moveme"
		93:
			text.text = "[center]Enter at your own risk. \n I can't track your movemen"
		94:
			text.text = "[center]Enter at your own risk. \n I can't track your movement"
		95:
			text.text = "[center]Enter at your own risk. \n I can't track your movements"
		96:
			text.text = "[center]Enter at your own risk. \n I can't track your movements o"
		97:
			text.text = "[center]Enter at your own risk. \n I can't track your movements on"
		98:
			text.text = "[center]Enter at your own risk. \n I can't track your movements onc"
		99:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once"
		100:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once y"
		101:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once yo"
		102:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you"
		103:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you'"
		104:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you'r"
		105:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're"
		106:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're i"
		107:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're in"
		108:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're ins"
		109:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're insi"
		110:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're insid"
		111:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're inside"
		112:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're inside."
		113:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're inside."
		114:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're inside.."
		115:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're inside.."
		116:
			text.text = "[center]Enter at your own risk. \n I can't track your movements once you're inside..."
		117:
			wordTimer.stop()
			self.queue_free()
			
func _on_timer_timeout() -> void:
	letterCount += 1
	
	if letterCount == 52:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
		
	if letterCount == 116:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
