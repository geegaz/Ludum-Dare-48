extends Node

export (PackedScene) var Mob

# Declare member variables here. Examples:
var nbEnemies = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for _i in range(5):
		$MobPath/MobSpawnLocation.offset = randi()
		var mob = Mob.instance()
		add_child(mob)
		mob.position = $MobPath/MobSpawnLocation.position
		var dirs = [Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN]
		mob.direction = dirs[randi() % dirs.size()]
		mob.rotation = mob.direction.angle()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
