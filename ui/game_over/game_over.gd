extends Control

@onready var final_score: Label = $BoxContainer/VBoxContainer/FinalScore

func _on_button_pressed():
	hide()
	Globals.reset_global_state()
	get_tree().change_scene_to_file("res://ui/main_menu/main_menu.tscn")

func _process(delta):
	if Globals.game_over:
		final_score.text = "Final Score: " + str(Globals.score)
		show()
