class_name AI
extends Area2D

@export var speed: int = 100
@export var parent_body: CharacterBody2D

var target: Player

func _physics_process(delta):
	if target:
		parent_body.look_at(target.global_position)
		parent_body.velocity = parent_body.transform.x * speed
		parent_body.move_and_slide()
	else:
		parent_body.velocity = Vector2.ZERO

func _on_body_exited(body: Node2D):
	if body is Player:
		target = null


func _on_body_entered(body: Node2D):
	if body is Player:
		target = body as Player
