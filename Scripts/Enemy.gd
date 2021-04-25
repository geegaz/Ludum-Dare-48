extends KinematicBody2D

class_name Enemy

const CELLSIZE = Vector2(16, 16)
var canMove = false
var direction = Vector2.RIGHT
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_parent().get_parent().get_node("MainTimer")
	if timer:
		timer.connect("timeout", self, "_on_MainTimer_timeout")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass

func _on_MainTimer_timeout():
	move()
	
func move():
	if(canMove):
		canMove = false
		if(!get_node("RayCast2D").is_colliding()):
			if !test_move(self.transform, direction*CELLSIZE):
				position += direction*CELLSIZE
		elif(get_node("RayCast2D").is_colliding()):
			randomize()
			match direction:
				Vector2.RIGHT:
					var dirs = [Vector2.UP, Vector2.LEFT, Vector2.DOWN]
					direction = dirs[randi() % dirs.size()]
					rotation = direction.angle()
				Vector2.UP:
					var dirs = [Vector2.RIGHT, Vector2.LEFT, Vector2.DOWN]
					direction = dirs[randi() % dirs.size()]
					rotation = direction.angle()
				Vector2.LEFT:
					var dirs = [Vector2.UP, Vector2.RIGHT, Vector2.DOWN]
					direction = dirs[randi() % dirs.size()]
					rotation = direction.angle()
				Vector2.DOWN:
					var dirs = [Vector2.UP, Vector2.LEFT, Vector2.RIGHT]
					direction = dirs[randi() % dirs.size()]
					rotation = direction.angle()
	else:
		canMove = true
