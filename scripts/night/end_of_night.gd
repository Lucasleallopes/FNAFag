extends Node

var fade_rect: ColorRect
var timer: Timer

func _ready():
	fade_rect = get_node("/root/Node3D/CanvasLayer/fade_rect")
	# Create and start the timer for 5 minutes
	timer = Timer.new()
	timer.wait_time = 10.0
	timer.one_shot = true
	add_child(timer)
	timer.timeout.connect(self._on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	# Ensure the fade rect starts transparent and visible
	var col = fade_rect.color
	col.a = 0.0
	fade_rect.color = col
	fade_rect.show()
	var tween = create_tween()
	tween.tween_property(fade_rect, "color:a", 1.0, 3.0)
	tween.finished.connect(self._on_fade_finished)

func _on_fade_finished():
	get_tree().change_scene_to_file("res://cutscene/FimDaNoite.tscn")
