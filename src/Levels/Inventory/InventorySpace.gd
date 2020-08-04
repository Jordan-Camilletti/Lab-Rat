extends Area2D

var mousePos

"""func _on_Space_mouse_entered():
	$Sprite.visible=true

func _on_Space_mouse_exited():
	$Sprite.visible=false"""
	
func roundDown(num):#Rounds down num to the nearest whole number
	var rtn=str(num).split(".")
	return(int(rtn[0]))

func _input(event):#Level Input
	if(event.is_action_pressed("moveDown")):#Quitting game
		print(get_local_mouse_position())
		$Sprite.position.x=get_local_mouse_position().x
		$Sprite.position.y=get_local_mouse_position().y
	
func _process(delta):
	mousePos=[roundDown(get_local_mouse_position().x/256)
			,roundDown(get_local_mouse_position().y/200)-1]
	if(mousePos[0]>=0 and mousePos[1]>=0):
		$Sprite.visible=true
		$Sprite.position.x=(mousePos[0]*256)+126
		$Sprite.position.y=(mousePos[1]*200)+300
	else:
		$Sprite.visible=false
