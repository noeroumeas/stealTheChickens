extends Node3D

@export var chicken_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in range(5) :
		var chicken = chicken_scene.instantiate()
		
		var player_position = $Player.position
		var rand = randf();
		var chicken_spawn_location = get_node("SpawnPath/SpawnLocation")
		print(chicken_spawn_location)
		chicken_spawn_location.progress_ratio = rand
		chicken.initialize(chicken_spawn_location.position, player_position)

		add_child(chicken)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
