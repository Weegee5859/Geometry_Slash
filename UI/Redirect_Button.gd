extends Button
@export var redirection_file_path: String

func _on_pressed():
	get_tree().change_scene_to_file(str(redirection_file_path))
