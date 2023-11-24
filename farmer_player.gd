extends CharacterBody3D

@export var speed = 12
signal playerCatched

var target_velocity = Vector3.ZERO
func _physics_process(_delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right_2"):
		direction.x += 1
	if Input.is_action_pressed("move_left_2"):
		direction.x -= 1
	if Input.is_action_pressed("move_back_2"):
		direction.z += 1
	if Input.is_action_pressed("move_forward_2"):
		direction.z -= 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)
	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	velocity = target_velocity

	
	move_and_slide()
	

func initialize(start_position, player_position):
	set_global_position(start_position)
	look_at(player_position, Vector3.UP)

func catchPlayer():
	playerCatched.emit()

