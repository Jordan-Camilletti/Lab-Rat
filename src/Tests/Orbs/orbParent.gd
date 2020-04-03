extends Area2D

func _ready():
	pass # Replace with function body.

func _on_Orb_area_entered(area):
	#Move from level test to inventory
	globalVars.inventory.append("O")
	"""TODO:
		Have orb move from testt levell to inventory"""
