extends Control

func _ready():
	var playButton = $PlayButton
	var exitButton = $QuitButton
	var playInfiniteButton = $PlayInfiniteButton
	var playDuoButton = $PlayDuoButton
	playButton.connect("pressed", _on_PlayButton_pressed)
	exitButton.connect("pressed", _on_ExitButton_pressed)
	playInfiniteButton.connect("pressed", _on_PlayInfiniteButton_pressed)
	playDuoButton.connect("pressed", _on_PlayDuoButton_pressed)

func _on_ExitButton_pressed():
	get_tree().quit()
	
func _on_PlayButton_pressed():
	
	get_tree().change_scene_to_file("res://game.tscn")
	
func _on_PlayInfiniteButton_pressed():
	get_tree().change_scene_to_file("res://game_infinite.tscn")
	
func _on_PlayDuoButton_pressed():
	get_tree().change_scene_to_file("res://game_duo.tscn")
