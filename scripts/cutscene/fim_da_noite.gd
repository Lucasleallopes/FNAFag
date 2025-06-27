extends Node

func _ready():
		var video = get_node("VideoStreamPlayer")
		video.finished.connect(self._on_video_finished)
		video.play()

func _on_video_finished():
		get_tree().change_scene_to_file("res://mainmenu.tscn")
