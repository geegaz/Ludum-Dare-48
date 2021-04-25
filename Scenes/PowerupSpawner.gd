extends Node
export (PackedScene) var Powerup

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var nb_powerup : int = 4




# Called when the node enters the scene tree for the first time.
func _ready():
	for nb in range(nb_powerup):
		var pu = Powerup.instance()
		add_child(pu)
		pu.position = Vector2(200,100)
		
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
