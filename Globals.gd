extends Node

var enemy_count = 0
var food_count = 0

var score = 0
var health = 100
var max_health = 100
var level = 0

# Upgrades
var armor = 0
var propellers = 0
var blades = 0
var endurance = 0
var toxins = 0
var cooldown = 0
var uranium_coating = 0

# MISC
var player_location: Vector2 = Vector2(0, 0)
var game_over = false

# Nodes
var passive_nodes: Array[Node2D] = []

# Signals
signal death

# Functions
func reset_global_state():
	enemy_count = 0
	food_count = 0

	score = 0
	health = 100
	max_health = 100
	level = 0

	armor = 0
	propellers = 0
	blades = 0
	endurance = 0
	toxins = 0
	cooldown = 0
	uranium_coating = 0

	player_location = Vector2(0, 0)
	game_over = false

	passive_nodes.clear()