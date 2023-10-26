extends CharacterBody3D

@export var min_speed = 7
@export var max_speed = 14

signal playerCatched

func _physics_process(_delta):
	move_and_slide()
	

func initialize(start_position, player_position):
	set_global_position(start_position)
	look_at(player_position, Vector3.UP)

func move(player_position):
	look_at(player_position, Vector3.UP)
	
	var random_speed = get_random_speed()
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)

func get_random_speed():
	return randi_range(min_speed, max_speed)

func catchPlayer():
	playerCatched.emit()

