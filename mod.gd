class_name Framework extends Mod

const pronoun_palace_version="1.2.8"
const framework_version="1.5.7-beta 5"

#static var spell_loader=load("res://mods/framework/spell_loader.gd")
#static var character_loader=load("res://mods/framework/character_loader.gd")
static var mod_settings_menu:Control

static var mod_settings_pages:Dictionary[String,Control]={}


static func change_script_and_copy_properties(object:Object,script:Script):
	# save all properties of main
	var properties:Dictionary[String,Variant]={}
	for property in object.get_property_list():
		if property.name!="script":
			properties[property.name]=object.get(property.name)
	#print(properties)
	print("saved properties")
	object.set_script(script)
	print("changed script")
	#await get_tree().process_frame
	# preset all properties
	for property in properties:
		object.set(property,properties[property])
	print("set properties")


func _ready() -> void:
	var tree:=get_tree()
	#tree.scene_changed.connect(_on_scene_change)
	#tree.node_added.connect(_on_node_added)
	#var current_scene=get_tree().current_scene
	#if current_scene is MainMenu:
		#run_main_menu_additions(current_scene)
	print("loaded spell framework")
	if pronoun_palace_version!=ProjectSettings.get_setting("application/config/version"):
		push_warning("The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+") may be incompatible with this version of the framework for "+pronoun_palace_version+". proceed at you own risk")
		if not OS.is_debug_build():
			var popup=load("res://mods/framework/incompatible_version_popup.tscn").instantiate()
			popup.get_node("Label").text="The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+")\nmay be incompatible with this version of the framework for "+pronoun_palace_version+"\nproceed at you own risk"
			add_child(popup)
	await tree.process_frame
	tree.reload_current_scene.call_deferred()

func load_save_data(data: Dictionary):
	CharacterLoader.save_data=data.get("character",{})
	CharacterLoader.save_data.merge(CharacterLoader.default_save_data)


func get_save_data() -> Dictionary:
	return {
		character=CharacterLoader.save_data
	}
