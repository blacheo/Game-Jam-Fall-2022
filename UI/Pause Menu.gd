extends Node
signal unpause
signal return_to_main_menu


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_pressed():
	get_tree().quit()


func _on_Play_pressed():
	emit_signal("unpause")


func _on_Main_Menu_pressed():
	emit_signal("return_to_main_menu")
