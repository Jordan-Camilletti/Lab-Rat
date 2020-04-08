extends Node

"""
	How to add a a scene child to a scene:
	var sceneToAdd = load(path)
	var add = sceneToAdd.instance()
	add_child(add)"""
	
func _ready():
	OS.window_fullscreen=true
	
func _input(event):#Level Input
	if(event.is_action_pressed("exitGame")):#Quitting game
		get_tree().quit()
	if(!globalVars.inventoryOpen):
		if(event.is_action_pressed("takeOutEquipedItem")):#Test adds
			testAdd()
		if(event.is_action_pressed("openInventory")):#Open inventory
			loadInventory()

func loadInventory():#Loads the inventory sreen
	globalVars.inventoryOpen=true
	get_tree().change_scene("res://src/Levels/Inventory/Inventory.tscn")

func testAdd():#Test adding random orb to level
	#Only used to test inventory
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var orbLinks=["Blue","Green","Orange","Purple","Red","Yellow"]
	var orb=orbLinks[rand.randi()%6]
	var testOrb=load("res://src/Tests/Orbs/"+orb+"/orb"+orb+".tscn").instance()
	testOrb.position.x=30
	testOrb.position.y=30
	add_child(testOrb)
