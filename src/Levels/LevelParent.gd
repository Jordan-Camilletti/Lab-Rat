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
	
func _physics_process(delta):
	if(globalVars.levelChangeFlag):#Change to next level
		globalVars.clearInventory()
		globalVars.setLevelChangeFlag(false)
		globalVars.setCurrLevel(nextLevelID)
		get_tree().change_scene(globalVars.getIDPath(nextLevelID))
	
func _input(event):#Level Input
	if(event.is_action_pressed("exitGame")):#Quitting game
		get_tree().quit()
	if(event.is_action_pressed("openInventory") and !globalVars.inventoryOpen):#Open inventory
		loadInventory()

func loadInventory():#Loads the inventory sreen
	globalVars.inventoryOpen=true
	get_tree().change_scene("res://src/Levels/Inventory/Inventory.tscn")
