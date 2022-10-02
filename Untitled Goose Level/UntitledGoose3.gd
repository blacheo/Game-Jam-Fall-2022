extends KinematicBody2D
signal caught

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D/AnimatedSprite.animation = "default"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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
