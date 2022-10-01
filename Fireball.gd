extends KinematicBody2D
export var speed = 100
export var firing = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if !firing:
		return
	var velocity = Vector2(1, 1)
	velocity = velocity.normalized() * speed
	position += velocity * delta



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
