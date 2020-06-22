extends ParentDoor

func _ready():
	key=103#Green key
	openSprite=load("res://assets/Doors/Test/open.png")
	closedSprite=load("res://assets/Doors/Green/closed.png")
	itemName="DoorGreen"
	itemID=203
	setSprite()
