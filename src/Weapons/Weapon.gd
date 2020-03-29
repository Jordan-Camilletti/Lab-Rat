extends KinematicBody2D
class_name Weapon

var icon
var dist
var damage
var weight

"""func _init(i,di,da,w):
	icon=i
	dist=di
	damage=da
	weight=w"""

func getName():
	return(name)

func getDist():
	return(dist)
	
func getDamage():
	return(damage)
	
func getWeight():
	return(weight)
