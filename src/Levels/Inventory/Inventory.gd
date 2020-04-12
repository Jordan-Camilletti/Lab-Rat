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
		add.position.x=(256*(n%3))+384
		add.position.y=(200*(n/3))+100
		add_child(add)

func _input(event):#Inventory Input
	if(event.is_action_pressed("exitGame")):#Quit game
		get_tree().quit()
	if(event.is_action_pressed("openInventory")):#Go back to level
		closeInventory("res://src/Levels/LevelTest.tscn")
	if(event.is_action_pressed("clickItem")):
		var mousePos=get_global_mouse_position()
		var square=getInventorySquare(mousePos.x,mousePos.y)
		if(square>=0 and square<len(globalVars.inventoryIDs)):
			var currID=globalVars.inventoryNames[getInventorySquare(mousePos.x,mousePos.y)]
			print(currID)
		else:
			print("Outside or empty")
		
func getInventorySquare(xPos,yPos):
	var xSquare=roundDown(xPos/256)-1
	var ySquare=roundDown(yPos/200)*3
	return(((xSquare+2)/(xSquare+2))*(xSquare+ySquare))

func closeInventory(level):#Closing back to level
	globalVars.inventoryOpen=false
	get_tree().change_scene(level)

func roundDown(num):#Rounds down num to the nearest whole number
	var rtn=str(num).split(".")
	return(int(rtn[0]))

func _on_Space_mouse_entered():
	pass # Replace with function body.
