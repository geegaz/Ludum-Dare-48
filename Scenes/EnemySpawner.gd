extends Node

export (PackedScene) var Mob

# Declare member variables here. Examples:
var nbEnemies = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$MobPath/MobSpawnLocation.offset = randi()
	for i in range(nbEnemies):
		var mob = Mob.instance()
		add_child(mob)
		var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
		mob.position = $MobPath/MobSpawnLocation.position
		direction += rand_range(-PI / 4, PI / 4)
		mob.rotation = direction
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
