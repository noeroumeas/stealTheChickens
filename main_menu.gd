extends Control

func _ready():
	var playButton = $PlayButton
	var exitButton = $QuitButton
	playButton.connect("pressed", _on_PlayButton_pressed)
	exitButton.connect("pressed", _on_ExitButton_pressed)

func _on_ExitButton_pressed():
	get_tree().quit()
	
func _on_PlayButton_pressed():
	
	get_tree().change_scene_to_file("res://game.tscn")
