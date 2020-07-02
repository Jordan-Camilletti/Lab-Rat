extends Node

var currLevel: = 002
var inventoryOpen: = false
var inventoryNames: = []
var inventoryIDs: = []
var heldName: = "Empty"
var heldID: = 000

var nodeDict: = {#Matches ID numbers to nodes
	#All values here are to be added on to res://src/
	000:"Empty",
	
	#001-099: Levels
	001:"Levels/Inventory/Inventory.tscn",#Inventory
	002:"Levels/LevelParent.tscn",#Parent level
	
	#100-199: Keys
	100:"Items/Keys/Red/KeyRed.tscn",#Red key
	101:"Items/Keys/Orange/KeyOrange.tscn",#Orange key
	102:"Items/Keys/Yellow/KeyYellow.tscn",#Yellow key
	103:"Items/Keys/Green/KeyGreen.tscn",#Green key
	104:"Items/Keys/Blue/KeyBlue.tscn",#Blue key
	
	#200-299: Doors
	#200:"Items/Doors/Test/TestDoor.tscn"#Test door(TESTING ONLY)
	200:"res://src/Obstacles/Doors/Red/DoorRed.tscn",#Red door
	201:"res://src/Obstacles/Doors/Orange/DoorOrange.tscn",#Orange door
	202:"res://src/Obstacles/Doors/Yellow/DoorYellow.tscn",#Yellow door
	203:"res://src/Obstacles/Doors/Green/DoorGreen.tscn",#Green door
	204:"res://src/Obstacles/Doors/Blue/DoorBlue.tscn"#Blue door

	#300-399: Cheese
	
	#400-499: AI
}

func getPath(id):#Returns the scene path based on given 'id'
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
