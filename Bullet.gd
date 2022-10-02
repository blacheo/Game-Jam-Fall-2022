extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var bulletSpeed = 300
var velocity = Vector2.ZERO
var direction = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	translate(velocity * bulletSpeed * delta * direction)

func flip_h(boo):
	$BulletSprite.flip_h = boo

func access_node():
	return $BulletSprite
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
