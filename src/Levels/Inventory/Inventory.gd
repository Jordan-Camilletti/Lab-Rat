extends Node2D

func _ready():
	refreshInventory()

func _input(event):#Inventory Input
	if(event.is_action_pressed("exitGame")):#Quit game
		get_tree().quit()
	if(event.is_action_pressed("openInventory")):#Go back to level
		closeInventory(globalVars.getIDPath(globalVars.currLevel))
	if(event.is_action_pressed("clickItem")):#Clicking on item
		var mousePos=get_global_mouse_position()#Getting item square
		var square=getInventorySquare(mousePos.x,mousePos.y)
		if(square==-1):#Rearranging items in queue
			print(int(mousePos.x/128))
			var selectedItem=0
		elif(square>=0 and square<len(globalVars.inventoryIDs)):#Adding it to queue
			globalVars.addToQueue(globalVars.inventoryIDs[square])
			globalVars.removeItem(square)
			refreshInventory()
		
func getInventorySquare(xPos,yPos):#Returns the inventory square of current mouse position
	var xSquare=roundDown(xPos/256)
	var ySquare=roundDown(yPos/200)-1
	if(xSquare<0 or xSquare>=4 or ySquare<0 or ySquare>=4):
		return(-1)
	return(xSquare+(ySquare*4))
	
func clearInventoryItems():#Clears all items from the inventory
	var node
	while(self.get_child_count()>2):
		node=self.get_children()[2]
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
		
	#Adding back queue
	for n in range(len(globalVars.itemQueue)):
		add=load(globalVars.getIDPath(globalVars.itemQueue[n])).instance()
		add.position.x=(128*(n%8))+64
		add.position.y=(40*(n/8))+100
		add_child(add)

func closeInventory(level):#Closing back to level
	globalVars.inventoryOpen=false
	if(globalVars.getHeldID()==000):
		globalVars.nextItem()
	get_tree().change_scene(level)

func roundDown(num):#Rounds down num to the nearest whole number
	var rtn=str(num).split(".")
	return(int(rtn[0]))
