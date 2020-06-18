extends Item
class_name ParentCheese

func _ready():
	pass
	
func on_item_collision(body):#When player collides with cheese
	print("Cheems")
