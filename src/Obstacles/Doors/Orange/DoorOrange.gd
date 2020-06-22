extends ParentDoor

func _ready():
	key=101#Orange key
	openSprite=load("res://assets/Doors/Test/open.png")
	closedSprite=load("res://assets/Doors/Orange/closed.png")
	itemName="DoorOrange"
	itemID=201
	setSprite()
