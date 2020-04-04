extends Actor

"""
TODO:
	Create item system
	Create & test doors 
	Create & test end goals
	Create & test multiple levels
	Create animations
"""
var walkAcceleration: = 80#Base walk speed
var runMultiplier: = 1.5#How much faster running is compared to walking
var slowdownConstant: = 0.4#The 'friction' constant
var velocity: = Vector2.ZERO

func _physics_process(delta):
	if(!globalVars.inventoryOpen):
		look_at(get_global_mouse_position())
		self.move_and_collide(velocity*delta)
		#print(collision)
		velocity += getAcceleration(velocity)
		#velocity = move_and_slide(velocity)

func getDirection() -> Vector2:
	return(Vector2(
		Input.get_action_strength("moveRight")-Input.get_action_strength("moveLeft"),
		Input.get_action_strength("moveDown")-Input.get_action_strength("moveUp")
	))

func getAcceleration(vel:Vector2) -> Vector2:
	var rtn=getDirection()
	rtn*=walkAcceleration#Initial directions
	if(Input.get_action_strength("run")>0):
		rtn*=runMultiplier#Faster if running
	for n in range(0,2):
		rtn[n]-=(vel[n]*slowdownConstant)#Slowing down to cap the speed
	return(rtn)
	
func _on_RedOrbPickup_area_entered(area) -> void:
	print("Red")


func _on_BlueOrbPickup_body_entered(body):
	print("Blue")
