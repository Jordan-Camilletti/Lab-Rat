extends Actor

"""
MAIN TODOs:
	Have inventory clear when swapping levels
	
	Create textures and characters
	Create & test multiple levels
	Create animations
"""
var walkAcceleration: = 80#Base walk speed
var runMultiplier: = 1.5#How much faster running is compared to walking
var slowdownConstant: = 0.4#The 'friction' constant
var velocity: = Vector2.ZERO

func _ready():
	addItem()

func _physics_process(delta):
	if(globalVars.itemChangeFlag):
		if(len(get_children())>4):#Removing the old item's sprite
			remove_child(get_children()[4])
		globalVars.nextItem()
		addItem()
		globalVars.setItemChangeFlag(false)
	if(!globalVars.inventoryOpen):
		look_at(get_global_mouse_position())#Looking at mouse
		#self.move_and_collide(velocity*delta)
		velocity += getAcceleration(velocity)#Changing velocity based on input
		velocity = move_and_slide(velocity)

func getDirection() -> Vector2:#Getting direction player should move
	return(Vector2(
		Input.get_action_strength("moveRight")-Input.get_action_strength("moveLeft"),
		Input.get_action_strength("moveDown")-Input.get_action_strength("moveUp")
	))

func getAcceleration(vel:Vector2) -> Vector2:#Getting how fast player should move
	var rtn=getDirection()
	rtn*=walkAcceleration#Initial directions
	if(Input.get_action_strength("run")>0):
		rtn*=runMultiplier#Faster if running
	for n in range(0,2):
		rtn[n]-=(vel[n]*slowdownConstant)#Slowing down to cap the speed
	return(rtn)

func addItem():
	if(globalVars.heldID!=0):
		var path=load(globalVars.getIDPath(globalVars.heldID))
		var add=path.instance()
		add.position.x=30
		add_child(add)
