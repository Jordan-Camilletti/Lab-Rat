extends Node

func _ready():
	var scene = load("res://src/Actor/Player.tscn")
	var player = scene.instance()
	add_child(player)
	
func _input(event):
	if(event.is_action_pressed("takeOutEquipedItem")):
		testAdd()
	if(event.is_action_pressed("openInventory")):
		overlayInventory()

func overlayInventory():
	var node = load("res://src/Level/Inventory.tscn").instance()
	get_node("/root/Level").add_child(node)

func testAdd():
	var rand = RandomNumberGenerator.new()
	var knife = load("res://src/Weapons/Melee/TestKnife/TestKnife.tscn").instance()
	var gun = load("res://src/Weapons/Ranged/TestGun/TestGun.tscn").instance()
	rand.randomize()
	knife.position.x=rand.randf_range(0,60)
	knife.position.y=rand.randf_range(0,60)
	gun.position.x=rand.randf_range(0,60)
	gun.position.y=rand.randf_range(0,60)
	add_child(knife)
	add_child(gun)
