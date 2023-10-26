extends Control

func _ready():
	var playAgainButton = $PlayAgainButton
	var mainMenuButton = $MainMenuButton
	playAgainButton.connect("pressed", _on_PlayAgainButton_pressed)
	mainMenuButton.connect("pressed", _on_MainMenuButton_pressed)

func _on_PlayAgainButton_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
	
func _on_MainMenuButton_pressed():
	
	get_tree().change_scene_to_file("res://main_menu.tscn")
