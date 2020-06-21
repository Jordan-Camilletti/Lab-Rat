extends ParentDoor

func _ready():
	key=100#Red key
	openSprite=load("res://assets/Doors/Open/TestDoor.png")
	closedSprite=load("res://assets/Doors/Closed/TestDoor.png")
	itemName="testDoor"
	itemID=200
	setSprite()
