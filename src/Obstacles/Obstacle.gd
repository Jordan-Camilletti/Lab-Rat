extends KinematicBody2D
class_name Obstacle

var itemName: = ""
var itemID: = 0

func get_name():
	return(itemName)
	
func get_ID():
	return(itemID)
	
func set_name(n):
	itemName=n

func set_ID(id):
	itemID=id
