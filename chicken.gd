extends CharacterBody3D

@export var min_speed = 10
@export var max_speed = 18

signal catched

func _physics_process(_delta):
	move_and_slide()
	

func initialize(start_position, player_position):
	set_global_position(start_position)
	look_opposite_to(player_position)
	rotate_to_random_direction()

func move(player_position):
	look_opposite_to(player_position)
	rotate_to_random_direction()
	
	var random_speed = get_random_speed()
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)

func look_opposite_to(position):
	look_at(position, Vector3.UP)
	rotate_y(PI)

func rotate_to_random_direction():
	rotate_y(randf_range(-PI/2, PI/2))

func get_random_speed():
	return randi_range(min_speed, max_speed)

func catch():
	catched.emit(self)
	queue_free()
