extends Node

var inventoryOpen: = false
var inventoryNames: = []
var inventoryIDs: = []
var heldName: = "Empty"
var heldID: = 0

var nodeDict: = {#Matches ID numbers to nodes
	#All values here are to be added on to res://src/
	0:"Empty",
	1:"Items/Tests/Orbs/Blue/orbBlue.tscn",#Blue orb
	2:"Items/Tests/Orbs/Green/orbGreen.tscn",#Green Orb
	3:"Items/Tests/Orbs/Orange/orbOrange.tscn",#Orange Orb
	4:"Items/Tests/Orbs/Purple/orbPurple.tscn",#Purple Orb
	5:"Items/Tests/Orbs/Red/orbRed.tscn",#Red Orb
	6:"Items/Tests/Orbs/Yellow/orbYellow.tscn",#Yellow Orb
}

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
