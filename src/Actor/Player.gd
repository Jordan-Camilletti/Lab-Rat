extends Actor

func _physics_process(delta):
	velocity = calculateMovement(speed, getDirection())

func getDirection() -> Vector2:
	return(Vector2(
		Input.get_action_strength("moveRight")-Input.get_action_strength("moveLeft"),
		Input.get_action_strength("moveDown")-Input.get_action_strength("moveUp")
	))

func calculateMovement(
	s: Vector2,
	d: Vector2
) -> Vector2:
	return(s*d)
