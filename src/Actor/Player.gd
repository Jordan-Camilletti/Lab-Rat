extends Actor

"""
TODO:
	Create inventory
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
var collision: = null

"""var kb2d = self.move_and_collide(velocity*delta)
  if (kb2d):
		print(collided with + str(kb2d.collider_id))"""

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


func _on_Area2D_area_entered(area):#When player hits object
	print("X")
