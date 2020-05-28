extends ParentDoor

func _ready():
	openSprite=load("res://assets/Doors/Open/TestDoor.png")
	closedSprite=load("res://assets/Doors/Closed/TestDoor.png")
	itemName="testDoor"
	itemID=6
	setSprite()

func _input(event):
	if(event.is_action_pressed("doorTest")):
		#setOpen(!getOpen())
		open=!open
		setSprite()

func setSprite():#Swaping the door's state
	if(open):#Set sprite to open
		$Sprite.texture=openSprite
	else:#Set sprite to close
		$Sprite.texture=closedSprite
