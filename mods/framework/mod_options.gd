extends Control

signal return_to_mod_list
signal option_changed(name:String,value)

static var check_box_scene:PackedScene=preload("res://source/ui/menu/settings/check_box_setting.tscn")
static var label_switch_setting_scene:PackedScene=preload("res://source/ui/menu/settings/label_switcher_setting.tscn")

var options:Array
var get_setting_method:Callable


func back():
	hide()
	return_to_mod_list.emit()

func _ready():
	for child in get_children():
		if child is Setting:
			child.load_setting()

## option format:
## name: name of the option, used for display and option_changed signal
## type: an int from Varient.Type, only supports booleans and strings now
## options: if type is string, an array of strings for the switcher 
func set_layout():
	for option in options:
		var setting:Setting
		match option.type:
			Variant.Type.TYPE_BOOL:
				setting=check_box_scene.instantiate()
			Variant.Type.TYPE_STRING:
				var label_switcher:LabelSwitcherSetting=label_switch_setting_scene.instantiate()
				for option_string:String in option.options:
					label_switcher.options.append(option_string)
				setting=label_switcher
		setting.use_string_key=false
		setting.setting_name=option.name
		setting.set_setting_methods(get_setting_method.bind(option.name),_on_option_changed.bind(option.name))
		add_child(setting)
	return self
		
func _on_option_changed(value,_name:String):
	option_changed.emit(_name,value)
	
