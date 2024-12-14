extends Area2D

@export var radius = 75

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var sprite: Sprite2D = $Sprite2D

var enemies_in_area: Array[Enemy] = []
var time_since_attack: float = 0.0

func _process(delta):
	if time_since_attack > 5.0 - (0.3 * (Globals.cooldown + 1)):
		for enemy in enemies_in_area:
			if !is_instance_valid(enemy):
				enemies_in_area.erase(enemy)
			else:
				enemy.take_damage(2 + 2 * Globals.toxins)

	(collision_shape.shape as CircleShape2D).radius = radius * (1 + (Globals.toxins + 1) * 0.2)
	sprite.scale.x = 1 * (1 + (Globals.toxins + 1) * 0.2)
	sprite.scale.y = 1 * (1 + (Globals.toxins + 1) * 0.2)

	time_since_attack += delta

func _on_body_exited(body: Node2D):
	if body is Enemy:
		enemies_in_area.erase(body as Enemy)

func _on_body_entered(body: Node2D):
	if body is Enemy:
		enemies_in_area.append(body as Enemy)
