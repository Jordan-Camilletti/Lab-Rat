extends Area2D
class_name Item

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

#When another object collides enters the items hitbox
func _on_Item_body_entered(body):
	on_item_colission(body)

#This method allows child classes to change their
#behavior for when an item enters their hitbox
func on_item_colission(body):
	pass
