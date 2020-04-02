extends Node

func _ready():
	var scene = load("res://src/Actor/Player.tscn")
	var player = scene.instance()
	add_child(player)
	
func _input(event):
	if(!globalVars.inventoryOpen):
		if(event.is_action_pressed("takeOutEquipedItem")):
			testAdd()
		if(event.is_action_pressed("openInventory")):
			loadInventory()

func loadInventory():#Loads the inventory sreen
	globalVars.inventoryOpen=true
	get_tree().change_scene("res://src/Levels/Inventory.tscn")
	#var node = load("res://src/Level/Inventory.tscn").instance()
	#get_node("/root/Level").add_child(node)

func addToInventory():
	print("N")

func testAdd():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var orbLinks=["Blue","Green","Orange","Purple","Red","Yellow"]
	var testOrb=load("res://src/Tests/Orbs/Orb"+orbLinks[rand.randi()%6]+".tscn").instance()
	#str("res://assets/Tests/Orbs/orb"+orbLinks[randOrb]+".png")
	testOrb.position.x=30
	testOrb.position.y=30
	add_child(testOrb)
