extends KinematicBody2D
signal caught

export var speed = 150
var dir = 1

var init_x = 800

# Called when the node enters the scene tree for the first time.
func _ready():
	var init_x = position.x
	



func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if abs(position.x-init_x) >= 150:
		velocity.x = 0
		dir *= -1
	velocity.x += dir * 2

	if abs(velocity.x) > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta

func toggle_off():
	visible = false
	set_collision_layer_bit(0,false)
	set_collision_mask_bit(0,false)

func toggle_on():
	visible = true
	set_collision_layer_bit(0,true)
	set_collision_mask_bit(0,true)


func _on_Area2D_body_entered(body):
	emit_signal("caught")
