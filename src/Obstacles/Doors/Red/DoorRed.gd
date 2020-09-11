extends ParentDoor

func _ready():
	key=100#Red key
	openSprite=load("res://assets/Doors/Red/Small/open.png")
	closedSprite=load("res://assets/Doors/Red/Small/closed.png")
	itemName="DoorRed"
	itemID=200
	setSprite()
