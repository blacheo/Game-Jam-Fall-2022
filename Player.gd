extends Area2D

export var speed = 400
export var bulletSpeed = 20

var bulletPath = preload("res://Bullet.tscn")
var bullet = bulletPath.instance()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func shoot():
	get_parent().add_child(bullet)
	if $AnimatedSprite.flip_h:	
		$Position2D.position = $AnimatedSprite.position - Vector2(300, 0)
		bullet.flip_h($AnimatedSprite.flip_h)
		bullet.position = $Position2D.global_position
	else:	
		bullet.flip_h($AnimatedSprite.flip_h)
		bullet.position = $Position2D.global_position
	

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$AnimatedSprite.flip_h = true	
		
	#if $AnimatedSprite.flip_h:

	#else:
	
	
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if abs(velocity.x) > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.animation = "running"
	else:
		$AnimatedSprite.animation = "idle" 
	
	position += velocity * delta
