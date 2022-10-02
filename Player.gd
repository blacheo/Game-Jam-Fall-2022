extends Area2D

export var speed = 400
export var bulletSpeed = 20

var bulletPath = preload("res://Bullet.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bulletList = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func shoot():
	var bullet = bulletPath.instance()
	#var timer = Timer.new()
	#timer.connect("timeout", self, "_on_timer_timeout")
	#get_parent().add_child(timer)
	#timer.start()
	$Gun.animation = "fired"

	if $AnimatedSprite.flip_h:
		$Position2D.position = $AnimatedSprite.position - Vector2(300, 0)
		bullet.flip_h($AnimatedSprite.flip_h)
		bullet.position = $AnimatedSprite.position
		bullet.position.x -= 3
		bullet.direction = -1
	else:	
		bullet.flip_h($AnimatedSprite.flip_h)
		bullet.position = $AnimatedSprite.position
		bullet.position.x += 300
		
	
	add_child(bullet)
	bulletList.append(bullet)

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
		$Gun.flip_h = false	
		$Gun.position.x = $AnimatedSprite.position.x	 + 200
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1	
		$AnimatedSprite.flip_h = true
		$Gun.flip_h = true
		$Gun.position.x = $AnimatedSprite.position.x	 - 200
		
	for i in bulletList:	
		i.position += Vector2(80,0) * i.direction
	
	
	if Input.is_action_just_pressed("shoot"):
		#$Gun.animation = "neutral"
		shoot()
	

		
	if abs(velocity.x) > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.animation = "running"
	else:
		$AnimatedSprite.animation = "idle" 
	
	position += velocity * delta
	
	
	#if bullet.position.x > get_viewport().get_visible_rect().size.x or bullet.position.x < 0:
	#	bullet.access_node().queue_free()
