extends ParentDoor

func _ready():
	key=104#Yellow key
	openSprite=load("res://assets/Doors/Blue/Small/open.png")
	closedSprite=load("res://assets/Doors/Blue/Small/closed.png")
	itemName="DoorBlue"
	itemID=204
	setSprite()
