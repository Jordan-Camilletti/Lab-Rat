extends Area2D

func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(body):
	print(str('Body entered: ', body.get_name()))

func _on_Orb_area_entered(area):
	#Move from level test to inventory
	print("hit")
