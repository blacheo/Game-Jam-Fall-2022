extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func toggle_off():
	visible = false
	set_collision_layer_bit(0,false)
	set_collision_mask_bit(0,false)

func toggle_on():
	visible = true
	set_collision_layer_bit(0,true)
	set_collision_mask_bit(0,true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
