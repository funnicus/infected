extends Node

var score = 0
var evolution_points = 0

var health = 100

# Upgrades
var armor_plate = 0
var propellers = 0
var bayonet = 0

# MISC
var player_location = Vector2(0, 0)
var game_over = false

# functions
func fibonacci(n):
	if n == 0:
		return 0
	elif n == 1:
		return 1
	else:
		return fibonacci(n - 1) + fibonacci(n - 2)