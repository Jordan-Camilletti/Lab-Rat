extends Node2D

func _ready():
	pass

func _input(event):#Inventory input
	if(event.is_action_pressed("openInventory")):
		closeInventory("res://src/Levels/LevelTest.tscn")
	if(event.is_action_pressed("testAddInventory")):
		print("Names")
		for n in globalVars.inventoryNames:
			print(n)
		print("\nIDs")
		for n in globalVars.inventoryIDs:
			print(n)

#func testAdd(item):#Test adding 'item' to inventory array
#	globalVars.inventory.append(item)

func closeInventory(level):#Closing back to level
	globalVars.inventoryOpen=false
	get_tree().change_scene(level)
"""TODO:
	Have inventory show up stuff on here"""
