extends Control

func _ready():
	hide()
	$AnimationPlayer.play("RESET")

func resume():
	hide()
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	
func pause():
	show()
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_pressed("esc") and get_tree().paused:
		resume()

func _on_continuar_pressed() -> void:
	resume()

func _on_sair_pressed() -> void:
	pass # Replace with function body.

func _on_configuracoes_pressed() -> void:
	get_tree().quit()

func _process(delta):
	testEsc()
