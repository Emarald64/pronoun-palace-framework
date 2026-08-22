class_name ModSettings extends Control

@onready var mod_list=$"Mod list"
static var mod_settings_page_factories:Dictionary[String,Callable]={}
@onready var alternating_page_box:AlternatingPageBox=get_node("../../../../../../PageMask/MarginContainer/LinkedScrollContainer/MarginContainer/AlternatingPageBox")

func _ready():
	alternating_page_box.source_boxes.append(mod_list)
	
	var mod_names=mod_settings_page_factories.keys()
	mod_names.sort()
	for mod_name:String in mod_names:
		var mod_setting_page=mod_settings_page_factories[mod_name].call()
		mod_setting_page.visible=false
		mod_setting_page.return_to_mod_list.connect(return_to_mod_list)
		if mod_setting_page is VBoxContainer:
			alternating_page_box.source_boxes.append(mod_setting_page)
		add_child(mod_setting_page)
		
		var button = Button.new()
		button.text=mod_name
		button.pressed.connect(mod_list.hide)
		button.pressed.connect(mod_setting_page.show)
		button.pressed.connect(alternating_page_box.update_panels)
		mod_list.add_child(button)
	#alternating_page_box.update_panels()

## Add a new entry to the list of mods in the mod settings menu [br]
## mod_name is the name that will show up in menu, it doesn't need to match your mod's internal id[br]
## page_factory should return a [Control] that is your mod's settings page
static func add_menu(mod_name:String,page_factory:Callable):
	mod_settings_page_factories[mod_name]=page_factory

## Connected to your mod's return_to_mod_list [Signal]. Shows the mod list again. Doesn't hide your mod's page, it should do that itself.
func return_to_mod_list()->void:
	mod_list.show()
	alternating_page_box.update_panels()
