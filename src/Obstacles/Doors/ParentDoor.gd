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

func _on_Detection_body_entered(body):
	if(!open):
		setOpen(!getOpen())
		$Hitbox.set_deferred("disabled", true)
		#get_node("Hitbox").disabled=true
		#$Hitbox.queue_free()
		print("OwO")


func _on_Detection_body_exited(body):
	if(open):
		setOpen(!getOpen())
		$Hitbox.set_deferred("disabled", false)
		print("UwU")
