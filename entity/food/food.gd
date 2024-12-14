extends CharacterBody2D

@export var score = 20

func _on_area_2d_body_entered(body: Node2D):
	if body == self or body is not Player:
		return

	Globals.health += Globals.max_health - Globals.health
	Globals.score += score
	queue_free()
