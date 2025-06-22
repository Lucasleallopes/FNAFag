extends CanvasLayer

func _ready():
        pause_mode = Node.PROCESS_MODE_ALWAYS
        hide()

func _input(event):
        if event.is_action_pressed("pause"):
                if get_tree().paused:
                        resume_game()
                else:
                        pause_game()

func pause_game():
        show()
        get_tree().paused = true

func resume_game():
        get_tree().paused = false
        hide()

func _on_exit_button_pressed():
        get_tree().paused = false
        get_tree().change_scene_to_file("res://mainmenu.tscn")
