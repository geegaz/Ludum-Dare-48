extends Node

onready var _Player = $PlayerBody

export var STARTING_POINT: NodePath
onready var _Start = get_node_or_null(STARTING_POINT)

export var CELLSIZE: Vector2 = Vector2(16, 16)

# Called when the node enters the scene tree for the first time.
func _ready():
	if _Start:
		_Player.position = _Start.position
	

func _on_MainTimer_timeout():
	_Player.move()

