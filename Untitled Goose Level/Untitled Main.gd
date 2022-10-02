extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Platform/Part2.toggle_off()
	$UntitledGoose2.toggle_off()
	$UntitledGoose3.toggle_off()

func _process(delta):
	pass


func _on_UntitledGoose1_caught():
	$UntitledGoose1.queue_free()
	$Platform/Part2.toggle_on()
	$UntitledGoose2.toggle_on()
	

func _on_UntitledGoose2_caught():
	print("test")
	$Platform/Part2.toggle_off()
	$UntitledGoose2.toggle_off()
	$UntitledGoose3.toggle_on()


func _on_UntitledGoose3_caught():
	pass # Replace with function body.
