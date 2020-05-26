extends ParentDoor

func _ready():
	itemName="testDoor"
	itemID=6

func _input(event):
	if(event.is_action_pressed("doorTest")):
		print("E")
