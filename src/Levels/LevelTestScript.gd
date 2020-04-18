extends Node

"""
	How to add a a scene child to a scene:
	var sceneToAdd = load(path)
	var add = sceneToAdd.instance()
	add_child(add)"""
	
func _ready():
	pass
	
func _input(event):#Level Input
	if(event.is_action_pressed("exitGame")):#Quitting game
		get_tree().quit()
	if(!globalVars.inventoryOpen):
		if(event.is_action_pressed("openInventory")):#Open inventory
			loadInventory()

func loadInventory():#Loads the inventory sreen
	globalVars.inventoryOpen=true
	get_tree().change_scene("res://src/Levels/Inventory/Inventory.tscn")
