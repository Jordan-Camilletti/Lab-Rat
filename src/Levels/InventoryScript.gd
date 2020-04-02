extends Node2D

var inventory: = []

func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("openInventory")):
		closeInventory()
	if(event.is_action_pressed("testAddInventory")):
		testAdd()

func testAdd():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var randOrb = rand.randi()%6
	var orbLinks=["Blue","Green","Orange","Purple","Red","Yellow"]
	var testOrb=load("res://src/Tests/Orbs/OrbBlue.tscn").instance()
	#str("res://assets/Tests/Orbs/orb"+orbLinks[randOrb]+".png")
	testOrb.position.x=30
	testOrb.position.y=30
	add_child(testOrb)
	print(randOrb)

func closeInventory():
	globalVars.inventoryOpen=false
	get_tree().change_scene("res://src/Levels/LevelTest.tscn")
