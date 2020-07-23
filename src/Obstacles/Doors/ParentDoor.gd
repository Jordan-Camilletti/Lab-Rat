extends Obstacle
class_name ParentDoor

var open=false#State of the door
var key#Key needed to open the door
var openSprite#Sprite for the open door
var closedSprite#Sprite for the closed door

func _ready():
	pass

func getOpen():
	return(open)
	
func setOpen(o):#Changing state and sprite
	open=o
	setSprite()
	
func setSprite():#Swaping the door's state
	if(open):#Set sprite to open
		$Sprite.texture=openSprite
	else:#Set sprite to close
		$Sprite.texture=closedSprite

func _on_Detection_body_entered(_body):
	if(!open and globalVars.heldID==key):
		globalVars.nextItem()
		print("HIT")
		setOpen(!getOpen())
		$Hitbox.set_deferred("disabled", true)
		#get_node("Hitbox").disablwdwqeqeqe12132e
		#$Hitbox.queue_free()

func _on_Detection_body_exited(_body):
	if(open):
		setOpen(!getOpen())
		$Hitbox.set_deferred("disabled", false)
