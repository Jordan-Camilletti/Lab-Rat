extends Actor

"""
TODO:
	Create inventory
	Have weapons be usable
	Create animations
"""
export var walkSpeed: = 30
var maxWalkSpeed = 60
export var runMultiplier: = 1.5
var maxRunSpeed = maxWalkSpeed*runMultiplier
var velocity: = Vector2.ZERO

"""
TODO: Create acceleration-based movement system
"""
func _physics_process(delta):
	look_at(get_global_mouse_position())
	$velocityTest.set_text(str(velocity[0],", ",velocity[1]))
	velocity = calculateMovement(getSpeed(velocity), getDirection())
	velocity = move_and_slide(velocity)
	

func getDirection() -> Vector2:
	return(Vector2(
		Input.get_action_strength("moveRight")-Input.get_action_strength("moveLeft"),
		Input.get_action_strength("moveDown")-Input.get_action_strength("moveUp")
	))

func getSpeed(vel:Vector2) -> Vector2:
	var rtn=maxWalkSpeed
	if(Input.get_action_strength("run")>0):
		rtn=walkSpeed*runMultiplier
	return(Vector2(rtn,rtn))

func calculateMovement(
	s: Vector2,
	d: Vector2
) -> Vector2:
	return(s*d)
