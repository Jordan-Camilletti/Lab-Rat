extends Node2D

func _ready():
	print("\nNames")
	for n in globalVars.inventoryNames:
		print(n)
	print("\nIDs")
	for n in globalVars.inventoryIDs:
		print("res://assets/"+globalVars.spriteDict.get(n))

func _input(event):#Inventory Input
	if(event.is_action_pressed("exitGame")):
		get_tree().quit()
	if(event.is_action_pressed("openInventory")):
		closeInventory("res://src/Levels/LevelTest.tscn")
	if(event.is_action_pressed("testAddInventory")):
		print("test add")

#func testAdd(item):#Test adding 'item' to inventory array
#	globalVars.inventory.append(item)

func closeInventory(level):#Closing back to level
	globalVars.inventoryOpen=false
	get_tree().change_scene(level)
