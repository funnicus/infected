extends Control

@export var toxins_node: PackedScene
@export var uranium_coating_node: PackedScene
@export var lysis_node: PackedScene

var score_until_next_level = 100
var previous_score_until_next_level = 100

func add_child_passive(path: NodePath, scene: PackedScene):
	var node = scene.instantiate()
	var player: Player = get_tree().get_root().get_node("Main/Player")
	player.add_child(node)

	var remote_transform: RemoteTransform2D = RemoteTransform2D.new()
	remote_transform.remote_path = path
	remote_transform.update_scale = false
	remote_transform.update_rotation = false

	player.add_child(remote_transform)
	Globals.passive_nodes.append(node)

func check_level_up():
	if Globals.score >= score_until_next_level:
		Globals.level += 1

		var temp = score_until_next_level
		score_until_next_level = score_until_next_level + previous_score_until_next_level
		previous_score_until_next_level = temp

		show()
		get_tree().paused = true

func resume():
	get_tree().paused = false
	hide()

func _process(delta):
	check_level_up()

	if Globals.game_over:
		hide()

func _on_cooldown_pressed():
	Globals.cooldown += 1
	resume()


func _on_blades_pressed():
	Globals.blades += 1
	resume()


func _on_toxins_pressed():
	Globals.toxins += 1

	if Globals.toxins == 1:
		add_child_passive("../ToxinCloud", toxins_node)

	resume()


func _on_propellers_pressed():
	Globals.propellers += 1
	resume()


func _on_endurance_pressed():
	Globals.endurance += 1
	Globals.max_health = Globals.max_health * (1 + 0.2 * Globals.endurance)
	resume()


func _on_uranium_coating_pressed():
	Globals.uranium_coating += 1

	if Globals.uranium_coating == 1:
		add_child_passive("../UraniumCoating", uranium_coating_node)

	resume()


func _on_armor_pressed():
	Globals.armor += 1
	resume()
