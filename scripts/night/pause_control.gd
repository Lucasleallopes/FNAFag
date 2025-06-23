extends Node

var pause_menu

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    pause_menu = get_node("/root/Node3D/CanvasLayer/PauseMenu")

func _unhandled_input(event):
    if event.is_action_pressed("pause"):
        _toggle_pause()

func _toggle_pause():
    var tree = get_tree()
    tree.paused = !tree.paused
    pause_menu.visible = tree.paused

func _on_exit_pressed():
    get_tree().paused = false
    get_tree().change_scene_to_file("res://mainmenu.tscn")
