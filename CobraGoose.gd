extends KinematicBody2D

export var speed = 500
var dir = 1
var fireball = preload("res://Fireball.tscn")
var flag = true
var multiplier = 1
var health = 100
var livesLeft = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if health == 0 and livesLeft > 0:
		health = 100
		multiplier += 1
	var velocity = Vector2.ZERO # The player's movement vector.
	if (abs(position.x-1000) <= 50 or position.x <= 50):
		velocity.x = 0 	
		dir *= -1
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
	if position.x <= 500:
		$AnimatedSprite.animation = "spit"
		for _i in range(multiplier):
			if flag:
				var fb = fireball.instance()
				get_parent().add_child(fb)
		flag = false
	else:
		$AnimatedSprite.animation = "default"
	velocity.x += dir * 2 * (multiplier)

	if abs(velocity.x) > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	if position.x > 500:
		flag = true

