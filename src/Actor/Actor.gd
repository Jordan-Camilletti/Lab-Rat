extends KinematicBody2D
class_name Actor

export var walkSpeed: = Vector2(300,300)
export var runSpeed: = 1.5
var velocity: = Vector2.ZERO

func _physics_process(delta):
	velocity = move_and_slide(velocity)
