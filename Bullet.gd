extends Area2D

export var bulletSpeed = 80
var velocity = Vector2.ZERO

func _ready():
	pass 

func physicsprocess(delta):
	pass

func flip_h(boo):
	$BulletSprite.flip_h = boo
