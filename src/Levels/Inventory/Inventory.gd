extends Node2D

func _ready():
	refreshInventory()

func _input(event):#Inventory Input
	if(event.is_action_pressed("exitGame")):#Quit game
		get_tree().quit()
	if(event.is_action_pressed("openInventory")):#Go back to level
		closeInventory(globalVars.getIDPath(globalVars.currLevel))
	if(event.is_action_pressed("clickItem")):
		var mousePos=get_global_mouse_position()
		var square=getInventorySquare(mousePos.x,mousePos.y)
		if(square>=0 and square<len(globalVars.inventoryIDs)):
			globalVars.addToQueue(globalVars.inventoryIDs[square])
			globalVars.removeItem(square)
			refreshInventory()
			print(globalVars.itemQueue)
		
func getInventorySquare(xPos,yPos):
	var xSquare=roundDown(xPos/256)
	var ySquare=roundDown(yPos/200)-1
	if(xSquare<0 or xSquare>=4 or ySquare<0 or ySquare>=4):
		return(-1)
	return(xSquare+(ySquare*4))
	
func clearInventoryItems():
	var node
	while(self.get_child_count()>7):
		node=self.get_children()[7]
		self.remove_child(node)
		node.queue_free()
	
func refreshInventory():
	#Clearing old items
	clearInventoryItems()
	
	#Adding back new inventory
	var add
	for n in range(len(globalVars.inventoryIDs)):
		#Creating a new instance based off link from inventoryID and nodeDict, then adding it to inventory square
		add=load(globalVars.getIDPath(globalVars.inventoryIDs[n])).instance()
		add.position.x=(256*(n%4))+128
		add.position.y=(200*(n/4))+300
		add_child(add)

func closeInventory(level):#Closing back to level
	globalVars.inventoryOpen=false
	get_tree().change_scene(level)

func roundDown(num):#Rounds down num to the nearest whole number
	var rtn=str(num).split(".")
	return(int(rtn[0]))
