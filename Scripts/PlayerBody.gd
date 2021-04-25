extends KinematicBody2D

const CELLSIZE = Vector2(16, 16)

var last_dir = Vector2.RIGHT
var new_dir = Vector2.RIGHT

var parts = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_parent().get_node("MainTimer")
	if timer:
		timer.connect("timeout", self, "_on_MainTimer_timeout")

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

func _on_MainTimer_timeout():
	move()

func move():
	if is_zero_approx(last_dir.dot(new_dir)):
		last_dir = new_dir
		rotation = last_dir.angle()
	
	if !test_move(self.transform, last_dir*CELLSIZE):
		position += last_dir*CELLSIZE

func add_part():
	pass

func remove_part(i: int):
	pass
