extends Area2D

func _on_Space_mouse_entered():
	$Sprite.visible=true

func _on_Space_mouse_exited():
	$Sprite.visible=false
