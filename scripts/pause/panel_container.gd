extends Control

onready var _root := get_parent()
onready var _anim := _root.get_node("AnimationPlayer")

func _ready():
        _root.hide()
        _anim.play("RESET")

func resume():
        _root.hide()
        get_tree().paused = false
        _anim.play_backwards("blur")
	
func pause():
        _root.show()
        get_tree().paused = true
        _anim.play("blur")

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_pressed("esc") and get_tree().paused:
		resume()

func _on_continuar_pressed() -> void:
	resume()

func _on_sair_pressed() -> void:
        get_tree().change_scene_to_file("res://mainmenu.tscn")

func _on_configuracoes_pressed() -> void:
	get_tree().quit()

func _process(delta):
	testEsc()
