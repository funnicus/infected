extends CharacterBody2D

@export var score = 20

func _on_area_2d_body_entered(body: Node2D):
	if body == self or body is not Player:
		return

	Globals.health += Globals.max_health - Globals.health
	Globals.score += score
	Globals.food_count -= 1
	queue_free()

func _ready():
	if Globals.food_count > 80:
		queue_free()
	else:
		Globals.food_count += 1

func _process(delta):
	print(Globals.player_location.distance_to(global_position))
	if Globals.player_location.distance_to(global_position) > 2000.0:
		queue_free()