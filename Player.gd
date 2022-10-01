extends Area2D

export var speed = 400
export var x = 0
export var y = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	x = position.x
	y = position.y
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
	if Input.is_action_just_pressed("ui_up"):
		velocity.y -= 10000
	

	if abs(velocity.x) > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.animation = "running"
	else:
		$AnimatedSprite.animation = "idle"
	if abs(velocity.y) > 0:
		for _i in range(velocity.y):
			position += velocity.normalized().y * delta
	position += velocity * delta
