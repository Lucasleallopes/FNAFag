extends Node

func _input(event):
	if event is InputEventKey and event.pressed:
		get_tree().change_scene_to_file("res://mainmenu.tscn")
	elif event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://mainmenu.tscn")
