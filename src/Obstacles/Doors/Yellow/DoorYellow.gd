extends ParentDoor

func _ready():
	key=102#Yellow key
	openSprite=load("res://assets/Doors/Test/open.png")
	closedSprite=load("res://assets/Doors/Yellow/Small/closed.png")
	itemName="DoorYellow"
	itemID=202
	setSprite()
