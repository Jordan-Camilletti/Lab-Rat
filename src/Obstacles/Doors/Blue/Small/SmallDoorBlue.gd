extends ParentDoor

func _ready():
	key=104#Blue key
	openSprite=load("res://assets/Doors/Blue/Small/open.png")
	closedSprite=load("res://assets/Doors/Blue/Small/closed.png")
	itemName="SmallDoorBlue"
	itemID=204
	setSprite()
