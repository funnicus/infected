extends Control

var upgrades_visible = false

@onready var location: Label = $Location

func _on_store_pressed():
	if upgrades_visible:
		$Upgrades.hide()
		upgrades_visible = false
	else:
		$Upgrades.show()
		upgrades_visible = true

func _process(delta):
	location.text = "Location: " + str(Globals.player_location)