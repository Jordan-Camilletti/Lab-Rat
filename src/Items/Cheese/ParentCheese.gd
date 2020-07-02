extends Item
class_name ParentCheese

func _ready():
	itemName = "Cheese Parent"
	itemID = 300
	
#Player beat level
func _on_Item_body_entered(_body):#When player collides with cheese
	globalVars.setLevelChangeFlag(true)
