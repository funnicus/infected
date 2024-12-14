extends CharacterBody2D

@export var health_bar: ProgressBar
@export var score: int = 100
@export var damage: int = 5
@export var health: int = 100
var target: Player

var taking_damage = false
var time_since_damage = 0
var time_since_attacked = 0

func take_damage(damage):
	health -= damage
	
	if health <= 0:
		queue_free()
		Globals.score += score
		Globals.evolution_points += score

func _on_ready():
	health_bar.max_value = health

func _on_hitbox_body_entered(body: Node2D):
	if body is Player:
		taking_damage = true
		target = body as Player

func _on_hitbox_body_exited(body: Node2D):
	if body is Player:
		taking_damage = false
		target = null

func _process(delta):
	health_bar.value = health

	if taking_damage and time_since_damage > 1:
		take_damage(10 * (Globals.bayonet + 1))
		time_since_damage = 0

	if target != null and time_since_attacked > Globals.armor_plate + 1:
		Globals.health -= damage - Globals.armor_plate
		time_since_attacked = 0

		if Globals.health <= 0:
			target.queue_free()

	time_since_damage += delta
	time_since_attacked += delta
