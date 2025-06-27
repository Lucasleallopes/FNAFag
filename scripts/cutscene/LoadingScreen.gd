extends Node

var loadedResource: PackedScene
var scenePath: String
var dummyProgress: Array = []
const useSubThreads: bool = true

signal loadDone

var timer_ready := false
var loading_ready := false

func loadScene(scene_path: String):
	scenePath = scene_path

	var newLoadingScreen = load("res://cutscene/LoadingScreen.tscn").instantiate()
	get_tree().get_root().add_child(newLoadingScreen)

	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = 2.0
	timer.autostart = true
	newLoadingScreen.add_child(timer)
	timer.timeout.connect(_on_timer_done)

	loadDone.connect(newLoadingScreen.loadDone)

	startLoad()

func _on_timer_done():
	timer_ready = true
	try_continue()

func startLoad():
	var state = ResourceLoader.load_threaded_request(scenePath, "", useSubThreads)
	if state == OK:
		set_process(true)

func _process(_delta):
	var load_status = ResourceLoader.load_threaded_get_status(scenePath, dummyProgress)
	if load_status == 3:
		loadedResource = ResourceLoader.load_threaded_get(scenePath)
		set_process(false)
		loading_ready = true
		try_continue()

func try_continue():
	if timer_ready and loading_ready:
		get_tree().change_scene_to_packed(loadedResource)
