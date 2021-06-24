extends Node

const SAVE_DIR = "user://saves/"
const FULL_PATH = "C:/Users/Berk/AppData/Roaming/Godot/app_userdata/CaseSimulator/saves"
var save_path = SAVE_DIR+"save.json"


var money_dollar = 0
var opened_fund_items = [{
		"item_name": "default",
		"fund_item_level": 1,
	}]
var opened_managers = []
var market_items_taken = []

var save_dict = {}



func _ready():
	var file = File.new()
	if file.file_exists(save_path):
		load_game()
		setup()
	save_game()


func save_game():
	save_dict = {
		"money_dollar": money_dollar,
		"opened_fund_items": opened_fund_items,
		"opened_managers": opened_managers,
		"market_items_taken": market_items_taken,
	}
	
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open_encrypted_with_pass(save_path, File.WRITE, "DdmdKA34JD")
	if error == OK:
		file.store_var(save_dict)
		file.close()

func load_game():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open_encrypted_with_pass(save_path, File.READ, "DdmdKA34JD")
		if error == OK:
			save_dict = file.get_var()
			file.close()


func setup():
	money_dollar = save_dict.get("money_dollar")
	opened_fund_items = save_dict.get("opened_fund_items")
	opened_managers = save_dict.get("opened_managers")

