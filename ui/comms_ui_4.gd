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
			text.text = "[center]C"
		2:
			text.text = "[center]Ca"
		3:
			text.text = "[center]Cap"
		4:
			text.text = "[center]Cap."
		5:
			text.text = "[center]Cap.."
		6:
			text.text = "[center]Cap..."
		7:
			text.text = "[center]Cap...C"
		8:
			text.text = "[center]Cap...Ca"
		9:
			text.text = "[center]Cap...Can"
		10:
			text.text = "[center]Cap...Can y"
		11:
			text.text = "[center]Cap...Can yo"
		12:
			text.text = "[center]Cap...Can you"
		13:
			text.text = "[center]Cap...Can you h"
		14:
			text.text = "[center]Cap...Can you he"
		15:
			text.text = "[center]Cap...Can you hea"
		16:
			text.text = "[center]Cap...Can you hear"
		17:
			text.text = "[center]Cap...Can you hear m"
		18:
			text.text = "[center]Cap...Can you hear me"
		19:
			text.text = "[center]Cap...Can you hear me?"
		20:
			text.text = "[center]Cap...Can you hear me?\nJ"
		21:
			text.text = "[center]Cap...Can you hear me?\nJu"
		22:
			text.text = "[center]Cap...Can you hear me?\nJus"
		23:
			text.text = "[center]Cap...Can you hear me?\nJust"
		24:
			text.text = "[center]Cap...Can you hear me?\nJust s"
		25:
			text.text = "[center]Cap...Can you hear me?\nJust sa"
		26:
			text.text = "[center]Cap...Can you hear me?\nJust saw"
		27:
			text.text = "[center]Cap...Can you hear me?\nJust saw y"
		28:
			text.text = "[center]Cap...Can you hear me?\nJust saw yo"
		29:
			text.text = "[center]Cap...Can you hear me?\nJust saw you"
		30:
			text.text = "[center]Cap...Can you hear me?\nJust saw you p"
		31:
			text.text = "[center]Cap...Can you hear me?\nJust saw you po"
		32:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop"
		33:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop b"
		34:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop ba"
		35:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop bac"
		36:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back"
		37:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nu"
		38:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup"
		39:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup o"
		40:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup on"
		41:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup on t"
		42:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup on th"
		43:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup on the"
		44:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup on the r"
		45:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup on the ra"
		46:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup on the rad"
		47:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup on the rada"
		48:
			text.text = "[center]Cap...Can you hear me?\nJust saw you pop back\nup on the radar"
		49:
			text.text = "[center]G"
		50:
			text.text = "[center]Go"
		51:
			text.text = "[center]Goo"
		52:
			text.text = "[center]Good"
		53:
			text.text = "[center]Good t"
		54:
			text.text = "[center]Good to"
		55:
			text.text = "[center]Good to s"
		56:
			text.text = "[center]Good to se"
		57:
			text.text = "[center]Good to see"
		58:
			text.text = "[center]Good to see y"
		59:
			text.text = "[center]Good to see yo"
		60:
			text.text = "[center]Good to see you"
		61:
			text.text = "[center]Good to see you m"
		62:
			text.text = "[center]Good to see you ma"
		63:
			text.text = "[center]Good to see you mad"
		64:
			text.text = "[center]Good to see you made"
		65:
			text.text = "[center]Good to see you made\ni"
		66:
			text.text = "[center]Good to see you made\nit"
		67:
			text.text = "[center]Good to see you made\nit o"
		68:
			text.text = "[center]Good to see you made\nit ou"
		69:
			text.text = "[center]Good to see you made\nit out"
		70:
			text.text = "[center]Good to see you made\nit out i"
		71:
			text.text = "[center]Good to see you made\nit out in"
		72:
			text.text = "[center]Good to see you made\nit out in o"
		73:
			text.text = "[center]Good to see you made\nit out in on"
		74:
			text.text = "[center]Good to see you made\nit out in one"
		75:
			text.text = "[center]Good to see you made\nit out in one p"
		76:
			text.text = "[center]Good to see you made\nit out in one pi"
		77:
			text.text = "[center]Good to see you made\nit out in one pie"
		78:
			text.text = "[center]Good to see you made\nit out in one piec"
		79:
			text.text = "[center]Good to see you made\nit out in one piece"
		80:
			text.text = "[center]Enter at your own risk.\nI can't tra"
		81:
			text.text = "[center]Enter at your own risk.\nI can't trac"
		82:
			text.text = "[center]Enter at your own risk.\nI can't track"
		83:
			text.text = "[center]Enter at your own risk.\nI can't track y"
		84:
			text.text = "[center]Enter at your own risk.\nI can't track yo"
		85:
			text.text = "[center]Enter at your own risk.\nI can't track you"
		86:
			text.text = "[center]Enter at your own risk.\nI can't track your"
		87:
			text.text = "[center]Enter at your own risk.\nI can't track your m"
		88:
			text.text = "[center]Enter at your own risk.\nI can't track your mo"
		89:
			text.text = "[center]Enter at your own risk.\nI can't track your mov"
		90:
			text.text = "[center]Enter at your own risk.\nI can't track your move"
		91:
			text.text = "[center]Enter at your own risk.\nI can't track your movem"
		92:
			text.text = "[center]Enter at your own risk.\nI can't track your moveme"
		93:
			text.text = "[center]Enter at your own risk.\nI can't track your movemen"
		94:
			text.text = "[center]Enter at your own risk.\nI can't track your movement"
		95:
			text.text = "[center]Enter at your own risk.\nI can't track your movements"
		96:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\no"
		97:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\non"
		98:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonc"
		99:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce"
		100:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce y"
		101:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce yo"
		102:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you"
		103:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you'"
		104:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you'r"
		105:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're"
		106:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're i"
		107:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're in"
		108:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're ins"
		109:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're insi"
		110:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're insid"
		111:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're inside"
		112:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're inside."
		113:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're inside."
		114:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're inside.."
		115:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're inside.."
		116:
			text.text = "[center]Enter at your own risk.\nI can't track your movements\nonce you're inside..."
		117:
			wordTimer.stop()
			self.queue_free()
			
func _on_timer_timeout() -> void:
	letterCount += 1
	
	if letterCount == 48:
		wordTimer.stop()
		await get_tree().create_timer(1.0).timeout
		wordTimer.start()
		
	if letterCount == 77:
		chatter.stop()
		
	if letterCount == 79:
		wordTimer.stop()
		await get_tree().create_timer(1.5).timeout
		wordTimer.start()
		chatter.stop()
		
	if letterCount == 115:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()
		
	if letterCount == 116:
		wordTimer.stop()
		await get_tree().create_timer(0.5).timeout
		wordTimer.start()


func _on_audio_stream_player_finished() -> void:
	chatter.play()
