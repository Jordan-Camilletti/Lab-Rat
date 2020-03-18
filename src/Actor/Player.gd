extends Actor

func _physics_process(delta):
	look_at(get_global_mouse_position())
	velocity = calculateMovement(getSpeed(), getDirection())

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
	var mousePos=get_viewport().get_mouse_position()
	print((0.5*get_viewport().size.y)-mousePos[1])
	return(0)
