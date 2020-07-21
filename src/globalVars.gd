extends Node

var currLevel: = 001#Level the player is currently on
var levelChangeFlag: = false#Flag for changing the level

var inventoryOpen: = false#Flag for if the inventory is open
var inventoryNames: = []#Inventory items
var inventoryIDs: = []

var heldName: = "Empty"#Obejct the player has equipped
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

func setLevelChangeFlag(l):
	levelChangeFlag=l

func getIDPath(id):#Returns the scene path based on given 'id'
	return("res://src/"+nodeDict.get(id))

func setHeld(n,id):#Changes the currently held item
	heldName=n
	heldID=id

func removeItem(spot):#Removes the item at 'spot'
	var tempNames: = []
	var tempIDs: = []
	for n in range(len(inventoryNames)):
		if(n!=spot):
			tempNames.append(inventoryNames[n])
			tempIDs.append(inventoryIDs[n])
	inventoryNames=tempNames
	inventoryIDs=tempIDs
