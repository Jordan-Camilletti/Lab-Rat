extends Item
class_name orbParent

func _ready():
	pass

func _on_Orb_body_entered(body):#When player collides with orb
	globalVars.inventoryNames.append(get_name())
	globalVars.inventoryIDs.append(get_ID())
	#print(get_name())
	queue_free()
