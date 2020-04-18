extends Area2D
class_name orbParent

var itemName: = ""
var itemID: = 0

func _ready():
	pass # Replace with function body.

func get_name():
	return(itemName)

"""Look into turning this into a hash function?"""
func get_ID():
	return(itemID)

func _on_Orb_body_entered(body):#When player collides with orb
	globalVars.inventoryNames.append(get_name())
	globalVars.inventoryIDs.append(get_ID())
	print(get_name())
	queue_free()
