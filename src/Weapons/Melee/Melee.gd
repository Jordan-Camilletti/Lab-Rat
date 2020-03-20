extends Node

class Melee:
	var name
	var icon
	var dist
	var damage
	var weight
	
	func _init(n,i,di,da,w):
		self.name=n
		self.icon=i
		self.dist=di
		self.damage=da
		self.weight=w
		
	func getName():
		return(name)
"""func _ready():
	"""
