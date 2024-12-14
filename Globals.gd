extends Node

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
var player_location = Vector2(0, 0)
var game_over = false

# Nodes
var passive_nodes: Array[Node2D] = []

# Signals
signal death
