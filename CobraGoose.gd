extends KinematicBody2D

export var speed = 500
var dir = 1
var fireball = preload("res://Fireball.tscn")
var flag = true
var flag2 = false
export var multiplier = 1
export var bossHealth = 100
export var livesLeft = 10
export var charging = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if position.x > 1300:
		position.x = 1200
	print(position.x)
	if bossHealth <= 0 and livesLeft > 0:
		bossHealth = 100
		multiplier += 1
		livesLeft -= 1
	elif bossHealth <= 0 and livesLeft == 0:
		pass # win screen displayed here
	if bossHealth == 50:
		charging = true
	var velocity = Vector2.ZERO # The player's movement vector.
	if !charging:
		if (abs(position.x-1200) <= 50 or position.x <= 50):
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
		velocity.x += dir * 2
	else:
		if !flag2:
			velocity.x = 1
		$AnimatedSprite.animation = "default"
		$AnimatedSprite.flip_h = false
		if position.x >= 1200:
			flag2 = true
		if flag2:
			velocity.x = -10
		print(position.x)

	

	if abs(velocity.x) > 0:
		velocity = velocity * speed * multiplier
	position += velocity * delta
	if position.x > 500:
		flag = true

