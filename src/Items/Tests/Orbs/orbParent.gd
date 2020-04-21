extends Item
class_name orbParent

func _ready():
	pass

func _on_Orb_body_entered(body):#When player collides with orb
	if(self.get_parent().get_name()!="Player"):#Player can't pick up their held item
		globalVars.inventoryNames.append(get_name())
		globalVars.inventoryIDs.append(get_ID())
		queue_free()
