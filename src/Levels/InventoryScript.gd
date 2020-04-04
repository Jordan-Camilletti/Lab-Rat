extends Node2D

func _ready():
	for i in globalVars.inventory:
		print(i)

func _input(event):#Inventory input
	if(event.is_action_pressed("openInventory")):
		closeInventory("res://src/Levels/LevelTest.tscn")
	if(event.is_action_pressed("testAddInventory")):
		testAdd("A")

func testAdd(item):#Test adding 'item' to inventory array
	globalVars.inventory.append(item)

func closeInventory(level):#Closing back to level
	globalVars.inventoryOpen=false
	get_tree().change_scene(level)
"""TODO:
	Have inventory show uip stuff on here"""
