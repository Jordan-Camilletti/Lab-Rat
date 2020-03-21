extends Node

var icon
var dist
var damage
var weight

func _physics_process(delta):
	#if(Input.get_action_strength("shoot")>0):
	$sprite.texture=load("res://assets/Weapons/knife.png")

func getName():
	return(name)
