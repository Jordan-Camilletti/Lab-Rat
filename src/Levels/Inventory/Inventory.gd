extends Node2D

#Lengths of queue and inventory, used for doing math
var queueXLen=8
var inventoryXLen=4
var inventoryYLen=2

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
			"""TODO:
				WORK ON ME"""
			var queueX=int(mousePos.x/128)
			var queueY=int(mousePos.y/100) * ((len(globalVars.itemQueue)-1)/queueXLen)
			#print(int(mousePos.x/128))#Queue x-pos
			#print(int(mousePos.y/100) * ((len(globalVars.itemQueue)-1)/queueXLen))#Queue y-pos
			#print("\n")
			var selectedItem=(queueX + (queueY*queueXLen))
			print(globalVars.globalQueueNames)
		elif(square>=0 and square<len(globalVars.inventoryIDs)):#Adding it to queue
			globalVars.addToQueue(globalVars.inventoryIDs[square])
			globalVars.removeItem(square)
			refreshInventory()
		
func getInventorySquare(xPos,yPos):#Returns the inventory square of current mouse position
	var xSquare=roundDown(xPos/256)
	var ySquare=roundDown(yPos/200)-1
	if(xSquare<0 or xSquare>=inventoryXLen or ySquare<0 or ySquare>=inventoryXLen):
		return(-1)
	return(xSquare+(ySquare*inventoryXLen))
	
func clearInventoryItems():#Clears all items from the inventory
	var node
	while(self.get_child_count()>inventoryYLen):
		node=self.get_children()[inventoryYLen]
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
		add.position.x=(256*(n%inventoryXLen))+128
		add.position.y=(200*(n/inventoryXLen))+300
		add_child(add)
		
	#Adding back queue
	var queueLen=len(globalVars.itemQueue)#Length of items in queue
	for n in range(queueLen):
		add=load(globalVars.getIDPath(globalVars.itemQueue[n])).instance()
		add.position.x=(128*(n%queueXLen))+64#X position for the item to be added at
		add.position.y=(100 * (n/queueXLen)) + (100 / (((queueLen-1)/queueXLen)+1))#Y position for the item to be added at
		add_child(add)

func closeInventory(level):#Closing back to level
	globalVars.inventoryOpen=false
	if(globalVars.getHeldID()==000):
		globalVars.nextItem()
	get_tree().change_scene(level)

func roundDown(num):#Rounds down num to the nearest whole number
	var rtn=str(num).split(".")
	return(int(rtn[0]))
