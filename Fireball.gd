extends KinematicBody2D
export var speed = 250
var velocity = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized() # replace this with player position

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(640, 279)

func _process(delta):
	if position.y >= 600 or position.y <= 0:
		queue_free()
	velocity = velocity.normalized() * speed
	position += velocity * delta
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
