extends KinematicBody2D

const ZERO_VELOCITY_Y = 6.7

const RUN_SPEED = 350
const JUMP_SPEED = 400 # Pixels up
const GRAVITY = 400
var health = 3
var bossHealth = 40

var velocity = Vector2()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')

	# $Heart1.visible = not $Heart1.visible
	if is_on_floor() and jump:
		velocity.y -= JUMP_SPEED

	if right:
		velocity.x += RUN_SPEED
		$AnimatedSprite.flip_h = false
	if left:
		velocity.x -= RUN_SPEED
		$AnimatedSprite.flip_h = true

	updateHearts()
	updateBossBar()
	if abs(velocity.x) > 0 or abs(velocity.y) > ZERO_VELOCITY_Y:
		$AnimatedSprite.animation = "running"
	else:
		$AnimatedSprite.animation = "idle"


func _physics_process(delta):
	velocity.y += GRAVITY * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))

func updateHearts():
	if health == 3:
		get_node("/root/Node/Camera2D/Heart1").visible = true
		get_node("/root/Node/Camera2D/Heart2").visible = true
		get_node("/root/Node/Camera2D/Heart3").visible = true
	elif health == 2:
		get_node("/root/Node/Camera2D/Heart1").visible = true
		get_node("/root/Node/Camera2D/Heart2").visible = true
		get_node("/root/Node/Camera2D/Heart3").visible = false
	elif health == 1:
		get_node("/root/Node/Camera2D/Heart1").visible = true
		get_node("/root/Node/Camera2D/Heart2").visible = false
		get_node("/root/Node/Camera2D/Heart3").visible = false
func updateBossBar():
	get_node("/root/Node/Camera2D/TextureProgress").value = bossHealth
