extends Node

onready var _Player = $Player

export var STARTING_POINT: NodePath
onready var _Start = get_node_or_null(STARTING_POINT)

export var CELLSIZE: Vector2 = Vector2(16, 16)
export var START_SIZE: int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_parent().get_node("MainTimer")
	if timer:
		timer.connect("timeout", self, "_on_MainTimer_timeout")
	
	if _Start:
		_Player.position = _Start.position
	
	if START_SIZE > 0:
		for i in range(START_SIZE):
			_Player.add_part(_Player.position- Vector2.RIGHT*(i+1)*CELLSIZE, 0)
	

func _on_MainTimer_timeout():
	_Player.move()

