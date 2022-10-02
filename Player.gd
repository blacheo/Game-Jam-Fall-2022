extends KinematicBody2D 

# Constants
const ZERO_VELOCITY_Y = 6.7
const RUN_SPEED = 350
const JUMP_SPEED = 400 # Pixels up
const GRAVITY = 400

# Constants for heart
const HEART_DIRECTORY = "/root/Node/Camera2D/Heart"
const HEART_MAX = 3 # Make sure to create this number of heart nodes

# Variables
var health = 3
var bossHealth = 100
var velocity = Vector2()

onready var screen = get_viewport().get_visible_rect().size


func get_input():
	if health <= 0:
		$AnimatedSprite.animation = "dead"
		velocity = Vector2.ZERO
		return
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
	if health <= 0:
		$AnimatedSprite.animation = "dead"
		return
	velocity.y += GRAVITY * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		var body = collision.collider
		if body.name in ["CobraGoose"] or "Fireball" in body.name and $AnimatedSprite.animation != "hurt":
			$AnimatedSprite.animation = "hurt"
			health -= 1
			if health < 0:
				health = 0
			position.y = 0
			get_node("/root/Node/Camera2D/Heart1").visible = false
			get_node("/root/Node/Camera2D/Heart2").visible = false
			get_node("/root/Node/Camera2D/Heart3").visible = false
			return


func update_hearts():
	# Makes sure that the number of hearts are within a valid range and loops over them
	# Was tested for health = 0 to 5 (inclusive)
	if 0 <= health and health <= HEART_MAX:
		for i in range(1, HEART_MAX+1):
			var dir = HEART_DIRECTORY+str(i)
			# Shows only the number of hearts based on the health
			if i <= health:
				get_node(dir).visible = true
			else:
				get_node(dir).visible = false
	
		
func updateBossBar():
	# get_node("/root/Node/Camera2D/TextureProgress").value = bossHealth
	pass
