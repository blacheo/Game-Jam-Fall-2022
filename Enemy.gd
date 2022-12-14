extends KinematicBody2D

export var speed = 300
var dir = 1
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if (abs(position.x-1000) <= 50 or position.x <= 50):
		velocity.x = 0
		dir *= -1
	velocity.x += dir * 2

	if abs(velocity.x) > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta

