extends Area2D

<<<<<<< Updated upstream
export var bulletSpeed = 80
var velocity = Vector2.ZERO

func _ready():
	pass 

func physicsprocess(delta):
	pass

func flip_h(boo):
	$BulletSprite.flip_h = boo
=======
export var bullet_speed = 300
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


func _process(delta):
	if $BulletSprite.flip_h:
		velocity.x -= bullet_speed
	else:
		velocity.x += bullet_speed
	position += velocity * delta


func flip_h(boo):
	$BulletSprite.flip_h = boo


func access_node():
	return $BulletSprite


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
>>>>>>> Stashed changes
