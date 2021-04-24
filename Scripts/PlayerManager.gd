extends Node

onready var _Player = $PlayerBody
onready var _Line = $PlayerLine

export var CELLSIZE: Vector2 = Vector2(16, 16)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func _on_MainTimer_timeout():
	_Player.move()

