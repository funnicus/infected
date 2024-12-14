extends Control

@onready var armor_plate: Button = $HBoxContainer/Left/ArmorPlate
@onready var propellers: Button = $HBoxContainer/Left/Propellers
@onready var bayonet: Button = $HBoxContainer/Left/Bayonet

var armor_plate_price: int = 8
var propellers_price: int = 5
var bayonet_price: int = 13

var prev_armor_plate_price: int = 0
var prev_propellers_price: int = 0
var prev_bayonet_price: int = 0

func calculate_prices():
	var temp_armor_plate_price = armor_plate_price
	var temp_propellers_price = propellers_price
	var temp_bayonet_price = bayonet_price

	armor_plate_price = armor_plate_price + prev_armor_plate_price
	propellers_price = propellers_price + prev_propellers_price
	bayonet_price = bayonet_price + prev_bayonet_price

	prev_armor_plate_price = temp_armor_plate_price
	prev_propellers_price = temp_propellers_price
	prev_bayonet_price = temp_bayonet_price

func _process(delta):
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
	calculate_prices()


func _on_propellers_pressed():
	Globals.propellers += 1
	propellers.text = "Propellers: " + str(Globals.propellers)
	Globals.evolution_points -= propellers_price
	calculate_prices()


func _on_bayonet_pressed():
	Globals.bayonet += 1
	bayonet.text = "Bayonet: " + str(Globals.bayonet)
	Globals.evolution_points -= bayonet_price
	calculate_prices()
