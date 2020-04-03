extends Node2D

func _ready():
	for i in globalVars.inventory:
		print(i)

func _input(event):
	if(event.is_action_pressed("openInventory")):
		closeInventory()
	if(event.is_action_pressed("testAddInventory")):
		testAdd("A")

func testAdd(item):
	globalVars.inventory.append(item)

func closeInventory():
	globalVars.inventoryOpen=false
	get_tree().change_scene("res://src/Levels/LevelTest.tscn")
