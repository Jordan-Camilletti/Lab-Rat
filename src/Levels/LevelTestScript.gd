extends Node

"""var scene = load(res://src/Actor/Player.tscn)
	var player = scene.instance()
	add_child(player)
	Adding a node child"""
	
func _input(event):#Level Input
	if(!globalVars.inventoryOpen):
		if(event.is_action_pressed("takeOutEquipedItem")):
			testAdd()
		if(event.is_action_pressed("openInventory")):
			loadInventory()

func loadInventory():#Loads the inventory sreen
	globalVars.inventoryOpen=true
	get_tree().change_scene("res://src/Levels/Inventory.tscn")

func testAdd():#Test adding orb to level
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var orbLinks=["Blue","Green","Orange","Purple","Red","Yellow"]
	var orb=orbLinks[rand.randi()%6]
	var testOrb=load("res://src/Tests/Orbs/"+orb+"/orb"+orb+".tscn").instance()
	testOrb.position.x=30
	testOrb.position.y=30
	add_child(testOrb)
