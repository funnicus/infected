extends Control

@onready var final_score: Label = $BoxContainer/VBoxContainer/FinalScore

func _on_button_pressed():
	get_tree().quit()

func _process(delta):
	if Globals.game_over:
		final_score.text = "Final Score: " + str(Globals.score)
		show()
