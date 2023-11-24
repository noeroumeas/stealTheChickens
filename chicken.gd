extends CharacterBody3D

@export var min_speed = 10
@export var max_speed = 18

signal catched

func _ready():
	$SoundEffectPlay.start()

func _physics_process(_delta):
	move_and_slide()

func initialize(start_position, player_position):
	set_global_position(start_position)
	look_opposite_to(player_position)
	rotate_to_random_direction()
	play_sound_in_random_time()

func play_sound_in_random_time():
	var minWaitMusicTime = 0.01
	var maxWaitMusicTime = 10
	set_timer_random_time(minWaitMusicTime, maxWaitMusicTime)

func set_timer_random_time(min, max):
	$SoundEffectPlay.wait_time = randi_range(min, max)

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


func _on_sound_effect_play_timeout():
	play_sound_effect();

func play_sound_effect():
	$SoundEffect.play()
