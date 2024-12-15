class_name Player
extends CharacterBody2D

@export var health_bar: ProgressBar
@export var levels: Array[Level]

@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

var speed = 100
var time_since_damage = 0
var level = 0
var time: float = 0.0

func play_death():
	audio_player.pitch_scale = randf_range(0.8, 1.2)
	audio_player.play()

func change_level():
	if len(levels) > level + 1:
		level += 1
	
	time = 0.0

func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("down", "up") * (speed + (20 * Globals.propellers + 1))

func _ready():
	Globals.death.connect(play_death)

func _physics_process(_delta):
	get_input()
	move_and_slide()
	Globals.player_location = global_position

func _process(delta: float):
	health_bar.value = Globals.health
	health_bar.max_value = Globals.max_health
	timer.wait_time = 0.5 / (level + 1)
	time += delta

	timer.wait_time = levels[level].spawn_rate

	if time > levels[level].duration:
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
	mob.global_position = mob_spawn_location.global_position

	get_parent().add_child(mob)
