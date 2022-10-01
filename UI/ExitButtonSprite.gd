extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_focus_entered():
	animation = "hover"


func _on_Exit_mouse_entered():
	animation = "hover"


func _on_Exit_focus_exited():
	animation = "default"


func _on_Exit_mouse_exited():
	animation = "default"
