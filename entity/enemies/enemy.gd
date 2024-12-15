class_name Enemy
extends CharacterBody2D

@export var health_bar: ProgressBar
@export var score: int = 100
@export var damage: int = 5
@export var attack_speed = 2.0
@export var health: int = 100

var target: Player
var max_health: int = 0

var taking_damage = false
var time_since_damage = 0
var time_since_attacked = 0

func take_damage(damage):
	health -= damage
	
	if health <= 0:
		Globals.score += score
		Globals.death.emit()
		Globals.enemy_count -= 1
		queue_free()

func _on_hitbox_body_entered(body: Node2D):
	if body is Player:
		taking_damage = true
		target = body as Player

func _on_hitbox_body_exited(body: Node2D):
	if body is Player:
		taking_damage = false
		target = null

func _ready():
	if Globals.enemy_count > 100:
		queue_free()
	else:
		Globals.enemy_count += 1
	
func _process(delta):
	# Hacky solution
	if max_health == 0:
		max_health = health
		health_bar.max_value = max_health

	health_bar.value = health

	if taking_damage and time_since_damage > 2.0 - (Globals.cooldown * 0.1):
		take_damage(10 * (Globals.blades * 2 + 1))
		time_since_damage = 0

	if target != null and time_since_attacked > attack_speed:
		Globals.health -= damage - Globals.armor
		time_since_attacked = 0

		if Globals.health <= 0:
			Globals.game_over = true
			target.queue_free()

	time_since_damage += delta
	time_since_attacked += delta
