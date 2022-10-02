extends Node
var bossPath = preload("res://CobraGoose.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	# boss = bossPath.instance()
	# call_deferred("add_child", boss)
	get_node("/root/Node/Camera2D/TextureProgress").value = 1000000
	pass

func _on_Player_collided():
	$Player.health -= 1

func _process(delta):
	get_node("/root/Node/Camera2D/TextureProgress").value -= 1
	$CobraGoose.playerPos = Vector2($Player.position.x, $Player.position.y)
	# $CobraGoose.sCenter = $Camera2D.get_camera_screen_center()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
