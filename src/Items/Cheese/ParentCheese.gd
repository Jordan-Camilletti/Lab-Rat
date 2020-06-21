extends Item
class_name ParentCheese

func _ready():
	pass
	
#Player beat level
func _on_Item_body_entered(_body):#When player collides with cheese
	print("Cheems")
