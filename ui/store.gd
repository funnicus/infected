extends Control

@onready var armor_plate: Button = $HBoxContainer/Left/ArmorPlate
@onready var propellers: Button = $HBoxContainer/Left/Propellers
@onready var bayonet: Button = $HBoxContainer/Left/Bayonet

var armor_plate_price = 0
var propellers_price = 0
var bayonet_price = 0

func _ready():
	hide()

func _process(delta):
	armor_plate_price = 100 * (Globals.armor_plate + 1)
	propellers_price = 50 * (Globals.propellers + 1)
	bayonet_price = 75 * (Globals.bayonet + 1)

	if Globals.evolution_points >= armor_plate_price:
		armor_plate.disabled = false
	else:
		armor_plate.disabled = true
	
	if Globals.evolution_points >= propellers_price:
		propellers.disabled = false
	else:
		propellers.disabled = true

	if Globals.evolution_points >= bayonet_price:
		bayonet.disabled = false
	else:
		bayonet.disabled = true

func _on_armor_plate_pressed():
	Globals.armor_plate += 1
	armor_plate.text = "Armor Plate: " + str(Globals.armor_plate)
	Globals.evolution_points -= armor_plate_price


func _on_propellers_pressed():
	Globals.propellers += 1
	propellers.text = "Propellers: " + str(Globals.propellers)
	Globals.evolution_points -= propellers_price


func _on_bayonet_pressed():
	Globals.bayonet += 1
	bayonet.text = "Bayonet: " + str(Globals.bayonet)
	Globals.evolution_points -= bayonet_price
