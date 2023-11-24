extends Control

func _ready():
	var retryButton = $RetryButton
	var mainMenuButton = $MainMenuButton
	retryButton.connect("pressed", _on_RetryButton_pressed)
	mainMenuButton.connect("pressed", _on_MainMenuButton_pressed)

func _on_RetryButton_pressed():
	get_tree().change_scene_to_file(Global.game_scene)
	
func _on_MainMenuButton_pressed():
	
	get_tree().change_scene_to_file("res://main_menu.tscn")
