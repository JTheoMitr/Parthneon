extends Node

var score
var health
var alive
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	score = 0
	health = 1
	alive = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
