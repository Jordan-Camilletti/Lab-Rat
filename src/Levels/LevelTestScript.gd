extends Node

"""var scene = load(res://src/Actor/Player.tscn)
	var player = scene.instance()
	add_child(player)
	Adding a node child"""
	
func _input(event):
	if(!globalVars.inventoryOpen):
		if(event.is_action_pressed("takeOutEquipedItem")):
			testAdd()
		if(event.is_action_pressed("openInventory")):
			loadInventory()

func loadInventory():#Loads the inventory sreen
	globalVars.inventoryOpen=true
	get_tree().change_scene("res://src/Levels/Inventory.tscn")

func testAdd():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var orbLinks=["Blue","Green","Orange","Purple","Red","Yellow"]
	var testOrb=load("res://src/Tests/Orbs/Orb"+orbLinks[rand.randi()%6]+".tscn").instance()
	testOrb.position.x=30
	testOrb.position.y=30
	add_child(testOrb)
