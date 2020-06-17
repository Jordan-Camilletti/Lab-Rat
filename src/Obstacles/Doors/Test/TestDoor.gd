extends ParentDoor

func _ready():
	openSprite=load("res://assets/Doors/Open/TestDoor.png")
	closedSprite=load("res://assets/Doors/Closed/TestDoor.png")
	key=""#No key
	itemName="testDoor"
	itemID=6
	setSprite()

func _input(event):
	pass
	if(event.is_action_pressed("doorTest") and !open):
		setOpen(!getOpen())
		$Hitbox.queue_free()
