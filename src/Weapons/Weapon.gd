extends Node

var icon
var dist
var damage
var weight

func _init(i,di,da,w):
	icon=i
	dist=di
	damage=da
	weight=w

func _physics_process(delta):
	print("owo")
	#if(Input.get_action_strength("shoot")>0):
	#$sprite.texture=load("res://assets/Weapons/knife.png")

func getName():
	return(name)

func getDist():
	return(dist)
	
func getDamage():
	return(damage)
	
func getWeight():
	return(weight)
