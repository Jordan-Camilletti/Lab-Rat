extends Actor

func _physics_process(delta):
	velocity = calculateMovement(getSpeed(), getDirection())
	getHeading()

func getDirection() -> Vector2:
	return(Vector2(
		Input.get_action_strength("moveRight")-Input.get_action_strength("moveLeft"),
		Input.get_action_strength("moveDown")-Input.get_action_strength("moveUp")
	))

func getSpeed() -> Vector2:
	if(Input.get_action_strength("run")>0):
		return(walkSpeed*runSpeed)
	return(walkSpeed)

func calculateMovement(
	s: Vector2,
	d: Vector2
) -> Vector2:
	return(s*d)

func getHeading() -> int:
	var projectResolution=Vector2(Globals.get("display/width"),Globals.get("display/height"))
	var mousePos=get_viewport().get_mouse_position()
	print(mousePos)
	return(0)
