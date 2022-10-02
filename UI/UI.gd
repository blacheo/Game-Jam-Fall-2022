extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Pause Menu".free()




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Pause_Menu_return_to_main_menu():
	#May need to adjust later
	get_tree().change_scene("res://UI/Main Menu.tscn")
