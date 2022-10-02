extends KinematicBody2D
export var speed = 250
var velocity
var screenCenter
onready var screen = get_viewport().get_visible_rect().size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(screen.x/2, screen.y/2)
	

func _process(delta):
	if (position.y >= 1200):
		queue_free()
	velocity = velocity.normalized() * speed
	position += velocity * delta
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
