extends Item
class_name ParentKey

func _ready():
	pass

func _on_Item_body_entered(_body):#When player collides with key
	if(self.get_parent().get_name()!="Player"):#Player can't pick up their held item
		globalVars.inventoryNames.append(get_name())
		globalVars.inventoryIDs.append(get_ID())
		queue_free()
