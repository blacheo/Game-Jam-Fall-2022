extends KinematicBody2D
export var speed = 250


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(640, 279)
	pass # Replace with function body.

func _process(delta):
	
	if position.y >= 600:
		queue_free()
	var velocity = Vector2(randf(), 1-randf()).normalized()
	velocity = velocity.normalized() * speed
	position += velocity * delta





# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
