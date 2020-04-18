extends Node

var inventoryOpen: = false
var inventoryNames: = []
var inventoryIDs: = []
var currName: = "Empty"
var currID: = 0

var nodeDict: = {#Matches ID numbers to nodes
	#All values here are to be added on to res://src/
	0:"Empty",
	1:"Tests/Orbs/Blue/orbBlue.tscn",#Blue orb
	2:"Tests/Orbs/Green/orbGreen.tscn",#Green Orb
	3:"Tests/Orbs/Orange/orbOrange.tscn",#Orange Orb
	4:"Tests/Orbs/Purple/orbPurple.tscn",#Purple Orb
	5:"Tests/Orbs/Red/orbRed.tscn",#Red Orb
	6:"Tests/Orbs/Yellow/orbYellow.tscn",#Yellow Orb
}
