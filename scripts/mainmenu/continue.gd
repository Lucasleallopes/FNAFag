extends Button
func _ready():
	var button = self;
	button.pressed.connect(self._button_pressed)

func _button_pressed():
                print("changing scene")
                LoadingScreen.next_scene_path = "res://night.tscn"
                get_tree().change_scene_to_file("res://cutscene/LoadingScreen.tscn")
