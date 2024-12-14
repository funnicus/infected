extends Area2D

@export var radius = 75

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var sprite: Sprite2D = $Sprite2D

func _process(_delta):
	(collision_shape.shape as CircleShape2D).radius = radius * (1 + (Globals.uranium_coating + 1) * 0.2)
	sprite.scale.y = 0.7 * (1 + (Globals.uranium_coating + 1) * 0.2)
	sprite.scale.y = 0.7 * (1 + (Globals.uranium_coating + 1) * 0.2)

func _on_body_exited(body: Node2D):
	if body is Enemy:
		var enemy = body as Enemy
		var ai = enemy.get_node("AI") as AI

		ai.speed = ai.speed * 2
		enemy.damage = enemy.damage * 2

func _on_body_entered(body: Node2D):
	if body is Enemy:
		var enemy = body as Enemy
		var ai = enemy.get_node("AI") as AI

		ai.speed = ai.speed / 2
		enemy.damage = enemy.damage / 2
