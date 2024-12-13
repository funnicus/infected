class_name Player
extends CharacterBody2D

@export var health_bar: ProgressBar
@export var levels: Array[Level]

var speed = 100
var time_since_damage = 0
var level = 0

func change_level():
	if global_position.x > 2000 or global_position.y > 2000 or global_position.x < -2000 or global_position.y < -2000:
		level = 1
	else:
		level = 0

func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("down", "up") * (speed * (Globals.propellers + 1))

func _physics_process(_delta):
	get_input()
	move_and_slide()
	Globals.player_location = global_position

func _process(delta):
	health_bar.value = Globals.health
	change_level()

func _on_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob: CharacterBody2D = levels[level].mobs.pick_random().instantiate()

	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var mob_spawn_location: PathFollow2D = $SpawnPath/SpawnLocation
	# And give it a random offset.
	mob_spawn_location.progress_ratio = randf()

	# Spawn the mob by adding it to the Main scene.
	get_parent().add_child(mob)
	mob.global_position = mob_spawn_location.global_position
