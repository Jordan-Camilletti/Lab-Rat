extends Node2D

func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("openInventory")):
		closeInventory()

func closeInventory():
	globalVars.inventoryOpen=false
	get_tree().change_scene("res://src/Level/LevelTest.tscn")
