extends ParentDoor

func _ready():
	key=103#Green key
	openSprite=load("res://assets/Doors/Green/Small/open.png")
	closedSprite=load("res://assets/Doors/Green/Small/closed.png")
	itemName="DoorGreen"
	itemID=203
	setSprite()
