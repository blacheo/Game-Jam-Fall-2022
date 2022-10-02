extends KinematicBody2D
export var speed = 250
var velocity = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
onready var screen = get_viewport().get_visible_rect().size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(640, 279)

func _process(delta):
	if position.y >= screen.y or position.y <= 0 or position.x <= 0 or position.x >= screen.x:
		queue_free()
	velocity = velocity.normalized() * speed
	position += velocity * delta
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
