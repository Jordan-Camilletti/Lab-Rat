extends Node
class_name LevelParent

"""
	How to add a a scene child to a scene:
	var sceneToAdd = load(path)
	var add = sceneToAdd.instance()
	add_child(add)
	
	Level squares are 96 units wide(48 unit radius)
"""
	
var itemName
var itemID
var nextLevelID
	
func _ready():
	pass
	
func _input(event):#Level Input
	if(globalVars.levelChangeFlag):#Change to next level
		globalVars.setLevelChangeFlag(false)
		get_tree().change_scene(globalVars.getIDPath(nextLevelID))
	if(event.is_action_pressed("exitGame")):#Quitting game
		get_tree().quit()
	if(!globalVars.inventoryOpen):
		if(event.is_action_pressed("openInventory")):#Open inventory
			loadInventory()

func loadInventory():#Loads the inventory sreen
	globalVars.inventoryOpen=true
	get_tree().change_scene("res://src/Levels/Inventory/Inventory.tscn")
