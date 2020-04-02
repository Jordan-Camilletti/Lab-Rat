extends Node2D

var inventory: = []

func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("openInventory")):
		closeInventory()
	if(event.is_action_pressed("testAddInventory")):
		testAdd()

func testAdd():
	print("OwO")

func closeInventory():
	globalVars.inventoryOpen=false
	get_tree().change_scene("res://src/Levels/LevelTest.tscn")
