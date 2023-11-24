extends Node3D

@export var chicken_scene: PackedScene

var chickens = []

var numberChickens = 5

func _ready():
	Global.game_scene = self.scene_file_path
	start_main_game_music()
	init_number_chicken_left_label()
	generate_chickens()

func start_main_game_music():
	$GameMainMusic.play()

func init_number_chicken_left_label():
	$UserInterface/NumberChickensLeftLabel.set_chicken_number(numberChickens)

func generate_chickens():
	for i in range(numberChickens) :
		generate_chicken()

func generate_chicken():
	var chicken = chicken_scene.instantiate()
	chickens.append(chicken)
	var player_position = $Player.position
	var rand = randf();
	var chicken_spawn_location = get_node("SpawnPath/SpawnLocation")
	chicken_spawn_location.progress_ratio = rand
	chicken.initialize(chicken_spawn_location.position, player_position)
	add_child(chicken)
	
	chicken.catched.connect(on_chicken_catched.bind())
	chicken.catched.connect($UserInterface/NumberChickensLeftLabel._on_chicken_catched.bind())

func on_chicken_catched(chicken):
	chickens.erase(chicken)
	if(len(chickens) == 0):
		win_game()
		

func win_game():
	end_game()
	get_tree().change_scene_to_file("res://win_menu.tscn")	

func _process(delta):
	pass

func _on_chicken_timer_timeout():
	move_chickens()

func move_chickens():
	var player_position = $Player.position
	for chicken in chickens:
		chicken.move(player_position)

func _on_player_hit():
	lost_game()

func lost_game():
	end_game()
	$GameMainMusic.stop()
	get_tree().change_scene_to_file("res://lost_menu.tscn")

func end_game():
	$UserInterface/NumberChickensLeftLabel.hide()
	stopTimers()
	delete_all_objects()

func stopTimers():
	$ChickenTimer.stop()

func delete_all_objects():
	
	delete_objects_in_array(chickens)

func delete_objects_in_array(objects):
	for object in objects:
		object.queue_free()
	objects.clear()

