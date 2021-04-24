extends KinematicBody2D

onready var manager = get_parent()

var last_dir = Vector2.RIGHT
var new_dir = Vector2.RIGHT

var parts = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_right"):
		new_dir = Vector2.RIGHT
	if event.is_action_pressed("ui_left"):
		new_dir = Vector2.LEFT
	if event.is_action_pressed("ui_up"):
		new_dir = Vector2.UP
	if event.is_action_pressed("ui_down"):
		new_dir = Vector2.DOWN

func move():
	if $RayCast2D.is_colliding():
		return
	if is_zero_approx(last_dir.dot(new_dir)):
		last_dir = new_dir
		manager._Line.add_point(position, 1)
	
	position = position + last_dir*manager.CELLSIZE

func add_part():
	pass

func remove_part(i: int):
	pass
