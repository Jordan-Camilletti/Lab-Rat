extends Area2D
class_name orbParent

var color: = ""
var ID: = 0

func _ready():
	pass # Replace with function body.

func get_color():
	return(color)

"""Look into turning this into a hash function?"""
func get_ID():
	return(ID)

func _on_Orb_body_entered(body):
	globalVars.inventoryNames.append(get_color())
	globalVars.inventoryIDs.append(get_ID())
	print(get_color())
	queue_free()
