extends CharacterBody2D

@export var ep = 20

func _on_area_2d_body_entered(body: Node2D):
	if body == self or body is not Player:
		return

	Globals.health += 100 - Globals.health
	Globals.evolution_points += ep
	queue_free()
