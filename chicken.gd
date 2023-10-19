extends CharacterBody3D

@export var min_speed = 10
@export var max_speed = 18


func _physics_process(_delta):
	move_and_slide()

func initialize(start_position, player_position):
	
	#print(player_position.inverse())
	look_at_from_position(start_position, player_position, Vector3.UP)
	rotate_y(randf_range(-PI / 2, PI / 2))
	
	var random_speed = randi_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)
