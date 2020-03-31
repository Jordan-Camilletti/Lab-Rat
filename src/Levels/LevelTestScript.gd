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
			overlayInventory()

func overlayInventory():
	globalVars.inventoryOpen=true
	get_tree().change_scene("res://src/Levels/Inventory.tscn")
	#var node = load("res://src/Level/Inventory.tscn").instance()
	#get_node("/root/Level").add_child(node)

func testAdd():
	var rand = RandomNumberGenerator.new()
	var knife = load("res://src/Items/Melee/TestKnife/TestKnife.tscn").instance()
	var gun = load("res://src/Items/Ranged/TestGun/TestGun.tscn").instance()
	rand.randomize()
	knife.position.x=rand.randf_range(0,60)
	knife.position.y=rand.randf_range(0,60)
	gun.position.x=rand.randf_range(0,60)
	gun.position.y=rand.randf_range(0,60)
	add_child(knife)
	add_child(gun)
