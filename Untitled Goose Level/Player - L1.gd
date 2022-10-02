extends KinematicBody2D

# Constants
const ZERO_VELOCITY_Y = 6.7
const RUN_SPEED = 350
const JUMP_SPEED = 400 # Pixels up
const GRAVITY = 400

# Constants for heart
const HEART_DIRECTORY = "/root/Node/HUD/Heart"
const HEART_MAX = 3 # Make sure to create this number of heart nodes

# Variables
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

	update_hearts()
	updateBossBar()
	if abs(velocity.x) > 0 or abs(velocity.y) > ZERO_VELOCITY_Y:
		$AnimatedSprite.animation = "running"
	else:
		$AnimatedSprite.animation = "idle"


func _physics_process(delta):
	velocity.y += GRAVITY * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))


func update_hearts():
	# Makes sure that the number of hearts are within a valid range and loops over them
	# Was tested for health = 0 to 5 (inclusive)
	if 0 < health and health <= HEART_MAX:
		for i in range(1, HEART_MAX+1):
			var dir = HEART_DIRECTORY+str(i)
			# Shows only the number of hearts based on the health
			if i <= health:
				get_node(dir).visible = true
			else:
				get_node(dir).visible = false
	
		
func updateBossBar():
	get_node("/root/Node/HUD/TextureProgress").value = bossHealth
