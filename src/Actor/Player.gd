extends Actor

func _physics_process(delta):
	look_at(get_global_mouse_position())
	velocity = calculateMovement(getSpeed(), getDirection())
	checkWeap()

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

func checkWeap():
	if(Input.get_action_strength("shoot")>0):
		get_node("weaponIcon").texture=load("res://assets/Weapons/knife.png")
