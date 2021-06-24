extends VBoxContainer


var case_opening = preload("res://Scenes and Scripts/CaseSystem.tscn")


export (Array, Texture) var blue_items
export (Array, Texture) var purple_items
export (Array, Texture) var red_items
export (Array, Texture) var special_items


var item_list = {}


func _ready():
	item_list = {
	"blue_items": blue_items,
	"purple_items": purple_items,
	"red_items": red_items,
	"special_items": special_items
	}


func _on_Button_pressed():
	var opening_scene = case_opening.instance()
	opening_scene.item_list = item_list
	get_tree().get_root().add_child(opening_scene)
