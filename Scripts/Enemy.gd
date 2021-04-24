extends KinematicBody2D

class_name Enemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if(!get_node("RayCast2D").is_colliding()):
		var velocity = Vector2()
		velocity.x += 1
		velocity = velocity.normalized() * speed
		velocity = move_and_slide(velocity)
