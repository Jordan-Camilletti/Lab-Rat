extends Area2D

func _on_Space_mouse_entered():
	$Sprite.visible=true
	#print("A")

func _on_Space_mouse_exited():
	$Sprite.visible=false
	#print("B")
