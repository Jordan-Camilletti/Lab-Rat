extends Node

var currLevel: = 001#Level the player is currently on
var levelChangeFlag: = false#Flag for changing the level

var inventoryOpen: = false#Flag for if the inventory is open
var inventoryNames: = []#Objexts in the player's inventory
var inventoryIDs: = []

var itemChangeFlag: = false#Flag for going to next item in queue
var queueNames: = []#Obects in the player's queue
var queueIDs: = []
var heldName: = "Empty"#Object the player has equipped
var heldID: = 000

var nodeDict: = {#Matches ID numbers to nodes
	#All values here are to be added on to res://src/
	000:"Empty",
	
	#001-099: Levels
	001:"Levels/Level 1/Level1.tscn",#Level 1
	002:"Levels/Level 2/Level2.tscn",#Level 2
	003:"Levels/Level 3/Level3.tscn",#Level 3
	
	#100-199: Keys
	100:"Items/Keys/Red/KeyRed.tscn",#Red key
	101:"Items/Keys/Orange/KeyOrange.tscn",#Orange key
	102:"Items/Keys/Yellow/KeyYellow.tscn",#Yellow key
	103:"Items/Keys/Green/KeyGreen.tscn",#Green key
	104:"Items/Keys/Blue/KeyBlue.tscn",#Blue key
	
	#200-299: Doors
	#200:"Items/Doors/Test/TestDoor.tscn"#Test door(TESTING ONLY)
	200:"Obstacles/Doors/Red/DoorRed.tscn",#Red door
	201:"Obstacles/Doors/Orange/DoorOrange.tscn",#Orange door
	202:"Obstacles/Doors/Yellow/DoorYellow.tscn",#Yellow door
	203:"Obstacles/Doors/Green/DoorGreen.tscn",#Green door
	204:"Obstacles/Doors/Blue/DoorBlue.tscn",#Blue door

	#300-399: Cheese
	300:"res://src/Items/Cheese/ParentCheese.gd"
	
	#400-499: AI
}

func getHeldID():
	return(heldID)
	
func getHeldName():
	return(heldName)

func addToInventory(itemName, ID):#Adds item to inventory
	inventoryNames.append(itemName)
	inventoryIDs.append(ID)

func addToQueue(itemName, ID):#Adds item to queue
	queueNames.append(itemName)
	queueIDs.append(ID)

func setLevelChangeFlag(l):#Sets the flag for whether the game should switch to the next level
	levelChangeFlag=l
	
func setItemChangeFlag(l):#Sets the flag for when the game should go to the next item
	itemChangeFlag=l
	
func setCurrLevel(l):#Used to set the level the inventory goes to
	currLevel=l

func getIDPath(id):#Returns the scene path based on given 'id'
	return("res://src/"+nodeDict.get(id))

"""func loadFirstItem():#Sets the held item for the first item of the queue
	if(len(itemQueue)>0):
		heldID=itemQueue[0]
	else:
		heldID=000"""
		
func clearInventory():#Clears inventory
	inventoryIDs.clear()
	inventoryNames.clear()
	
func clearQueue():#Clear queue
	queueIDs.clear()
	queueNames.clear()
		
func clearAllInventory():#Clear player's whole storage between levels
	clearInventory()
	clearQueue()
	heldName=""
	heldID=000

func nextItem():#Sets the currently held item to whatever's next in queue
	var next
	#Checking that the last item isn't what the player has equipped
	if(heldID!=000 and len(queueIDs)<=1):
		queueIDs.pop_front()
		heldID=000
	#Checking that a next item exists
	elif(len(queueIDs)>0):
		if(heldID!=000):#Player is currently holding anything
			queueIDs.pop_front()#Removing first item
		next=queueIDs[0]
		heldID=next
	#If the queue is empty
	else:
		heldID=000

func removeItem(spot):#Removes the item at 'spot' from inventory
	var tempNames: = []
	var tempIDs: = []
	for n in range(len(inventoryNames)):
		if(n!=spot):
			tempNames.append(inventoryNames[n])
			tempIDs.append(inventoryIDs[n])
	inventoryNames=tempNames
	inventoryIDs=tempIDs
