extends Node

var inventoryOpen: = false
var inventoryNames: = []
var inventoryIDs: = []
var heldName: = "Empty"
var heldID: = 0

var nodeDict: = {#Matches ID numbers to nodes
	#All values here are to be added on to res://src/
	0:"Empty",
	
	1:"Items/Keys/Red/KeyRed.tscn",#Red key
	2:"Items/Keys/Orange/KeyOrange.tscn",#Orange key
	3:"Items/Keys/Yellow/KeyYellow.tscn",#Yellow key
	4:"Items/Keys/Green/KeyGreen.tscn",#Green key
	5:"Items/Keys/Blue/KeyBlue.tscn",#Blue key
	
	6:"Items/Doors/Test/TestDoor.tscn"#Test door(TESTING ONLY)
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
