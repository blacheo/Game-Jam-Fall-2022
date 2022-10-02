extends Area2D

const GUN_COOLDOWN_TIME = 0.5

export var speed = 400
export var bulletSpeed = 20

var bullet_path = preload("res://Bullet.tscn")
var time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	

func shoot():
<<<<<<< Updated upstream
	get_parent().add_child(bullet)
	
	if $AnimatedSprite.flip_h:
		$Position2D.position = $AnimatedSprite.position - Vector2(300, 0)
		bullet.flip_h($AnimatedSprite.flip_h)
		bullet.position = $Position2D.global_position
	else:	
		bullet.flip_h($AnimatedSprite.flip_h)
		bullet.position = $Position2D.global_position

	$CooldownTimer.start()
=======
	var bullet = bullet_path.instance()
	get_parent().call_deferred("add_child", bullet)
	
	$Gun.animation = "fired"
	if $AnimatedSprite.flip_h:
		$Position2D.position = $AnimatedSprite.position - Vector2(300, 0)
	else:
		$Position2D.position = $AnimatedSprite.position + Vector2(400, 0)
		
	bullet.flip_h($AnimatedSprite.flip_h)
	bullet.position = $Position2D.global_position
>>>>>>> Stashed changes
	

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	time += delta
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
		$Gun.flip_h = false
		$Gun.position = $AnimatedSprite.position + Vector2(195,95)
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
<<<<<<< Updated upstream
		$AnimatedSprite.flip_h = true
		$Gun.flip_h = true
		$Gun.position = $AnimatedSprite.position + Vector2(-195,95)
	
	if not $CooldownTimer.is_stopped():
		$Gun.animation = "fired"
	else:
		$Gun.animation = "neutral"
	
	if Input.is_action_pressed("shoot") and $CooldownTimer.is_stopped():
=======
		$AnimatedSprite.flip_h = true	
		
	
	# Shooting
	if Input.is_action_just_pressed("shoot") and time > GUN_COOLDOWN_TIME:
>>>>>>> Stashed changes
		shoot()
		time = 0
	

		
	if abs(velocity.x) > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.animation = "running"
	else:
		$AnimatedSprite.animation = "idle" 
	
	position += velocity * delta
<<<<<<< Updated upstream
	
	if $AnimatedSprite.flip_h:
		bullet.position -= Vector2(bullet.bulletSpeed, 0)
	else:
		bullet.position += Vector2(bullet.bulletSpeed,0)
=======
>>>>>>> Stashed changes


