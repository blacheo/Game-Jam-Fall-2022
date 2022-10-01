extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var bulletSpeed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var velocity = Vector2.ZERO
	
	position += velocity * delta

func flip_h(boo):
	$BulletSprite.flip_h = boo
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
