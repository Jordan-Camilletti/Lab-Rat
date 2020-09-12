extends ParentDoor

func _ready():
	key=101#Orange key
	openSprite=load("res://assets/Doors/Orange/Small/open.png")
	closedSprite=load("res://assets/Doors/Orange/Small/closed.png")
	itemName="SmallDoorOrange"
	itemID=203
	setSprite()
