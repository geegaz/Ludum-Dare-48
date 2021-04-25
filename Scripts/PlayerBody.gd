extends KinematicBody2D

onready var manager = get_parent()

var last_dir = Vector2.RIGHT
var new_dir = Vector2.RIGHT

var parts = []
var part_resource = preload("res://Scenes/player/PlayerPart.tscn")
var can_move = true

var worm_size: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	can_move = !$RayCast2D.is_colliding()

func _input(event):
	if event.is_action_pressed("ui_right"):
		new_dir = Vector2.RIGHT
	
	if event.is_action_pressed("ui_left"):
		new_dir = Vector2.LEFT
	
	if event.is_action_pressed("ui_up"):
		new_dir = Vector2.UP
	
	if event.is_action_pressed("ui_down"):
		new_dir = Vector2.DOWN
	
	
	
	if is_zero_approx(last_dir.dot(new_dir)):
		last_dir = new_dir
		rotation = last_dir.angle()

func move():
	if can_move:
		add_part(position, rotation)
		remove_part(-1)
		
		
		position += last_dir*manager.CELLSIZE
		

func add_part(pos: Vector2, rot: float):
	var new_part = part_resource.instance()
	new_part.position = pos
	new_part.rotation = rot
	
	manager.add_child(new_part)
	parts.append(new_part)
	
	worm_size += 1

func remove_part(i: int):
	var old_part = parts.pop_front()
	old_part.queue_free()
	
	worm_size -= 1
	
