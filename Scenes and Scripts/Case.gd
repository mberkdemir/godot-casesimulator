extends VBoxContainer

onready var case_opening = preload("res://Scenes and Scripts/CaseSystem.tscn")


func _on_Button_pressed():
	var opening_scene = case_opening.instance()
	get_tree().get_root().add_child(opening_scene)
