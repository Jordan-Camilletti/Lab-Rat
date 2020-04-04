extends Node2D

"""
TODO:
	Highlight currently selected square
	Have math be based on screen size instead of hard-coded
	Have way to move items to player
"""

func _ready():
	var add=""
	for n in range(len(globalVars.inventoryIDs)):
		#Creating a new instance based off link from inventoryID and nodeDict, then adding it to inventory square
		add=load("res://src/"+globalVars.nodeDict.get(globalVars.inventoryIDs[n])).instance()
		add.position.x=(115*(n%9))+55
		add.position.y=(120*(n/9))+55
		add_child(add)

func _input(event):#Inventory Input
	if(event.is_action_pressed("exitGame")):#Quit game
		get_tree().quit()
	if(event.is_action_pressed("openInventory")):#Go back to level
		closeInventory("res://src/Levels/LevelTest.tscn")

func closeInventory(level):#Closing back to level
	globalVars.inventoryOpen=false
	get_tree().change_scene(level)
