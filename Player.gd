extends KinematicBody2D

const ZERO_VELOCITY_Y = 6.7

const RUN_SPEED = 350
const JUMP_SPEED = 400 # Pixels up
const GRAVITY = 400

var velocity = Vector2()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')
	
	if is_on_floor() and jump:
		velocity.y -= JUMP_SPEED
	
	if right:
		velocity.x += RUN_SPEED
		$AnimatedSprite.flip_h = false
	if left:
		velocity.x -= RUN_SPEED
		$AnimatedSprite.flip_h = true
	
	print(velocity.y)
	if abs(velocity.x) > 0 or abs(velocity.y) > ZERO_VELOCITY_Y:
		$AnimatedSprite.animation = "running"
	else:
		$AnimatedSprite.animation = "idle"
		

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
