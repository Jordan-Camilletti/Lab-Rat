extends ParentDoor

func _ready():
	key=103#Green key
	openSprite=load("res://assets/Doors/Green/Small/open.png")
	closedSprite=load("res://assets/Doors/Green/Small/closed.png")
	itemName="SmallDoorGreen"
	itemID=209
	setSprite()
