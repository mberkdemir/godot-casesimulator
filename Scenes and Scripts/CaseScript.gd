extends Control


onready var item_container = $"Case Scroll Container/Item Container"
onready var case_container = $"Case Scroll Container"
onready var panel = $Panel

var item_list = [
	preload("res://Sprites/kirmizi.png"),
	preload("res://Sprites/mavi.png"),
	preload("res://Sprites/mor.png"),
	preload("res://Sprites/sari.png")
]


var texture_rects = []
var increase_value = 0
var index_number = 2
var high_limit = 270
var speed = 40
var case_stopped = false


func _ready():
	case_container.get_h_scrollbar().rect_scale.x = 0
	for i in range(0,100):
		randomize()
		var img_texture = randi() % item_list.size()
		var img = TextureRect.new()
		img.texture = item_list[img_texture]
		texture_rects.append(img)
		item_container.add_child(img)


func _process(delta):
	if not case_stopped:
		increase_value += 1 * speed
		case_container.scroll_horizontal = increase_value
		if case_container.scroll_horizontal > high_limit:
			index_number += 1
			high_limit += 260


func _on_Timer_timeout():
	if speed > 0 and not case_stopped:
		speed -= 0.5
	elif speed <= 0:
		case_stopped = true
		panel.get_child(1).texture = texture_rects[index_number].texture
		panel.show()


func _on_ButtonPanel_pressed():
	queue_free()
