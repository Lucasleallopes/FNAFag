extends Node

@onready var timer: Timer = $Timer
var destino: String = ""

var canContinue: bool = false
var shouldFree: bool = false

func _ready():
	timer.timeout.connect(_on_timer_timeout)  # Garante que o sinal esteja conectado
	timer.start(2.0)  # Inicia o Timer com 5 segundos

func loadDone():
	if canContinue:
		call_deferred("queue_free")
	else:
		shouldFree = true

func _on_timer_timeout():
        if shouldFree:
                call_deferred("queue_free")
        get_tree().change_scene_to_file(LoadingScreen.next_scene_path)
        canContinue = true
