class_name Framework extends Mod

const pronoun_palace_version="1.2.2"
const framework_version="1.5.2"

#static var spell_loader=load("res://mods/framework/spell_loader.gd")
#static var character_loader=load("res://mods/framework/character_loader.gd")
static var mod_settings_menu:Control

static var mod_settings_pages:Dictionary[String,Control]={}

## Adds a spell to the list of spells that can appear randomly
## A higher weight makes the spell appear more often
## The catagory is used to determine whether it it will appear in the jubilist's boxes 
## @deprecated: call [method SpellLoader.add_spell] instead
static func add_spell(id:String,weight:float=1.0,catagory=null)->void:
	push_warning("calling add_spell through mod.gd is deprecated, please call add_spell through spell_loader now")
	SpellLoader.add_spell(id,weight,catagory)

## @deprecated: call add_vanillia_spells through spell_loader
static func add_vanillia_spells()->void:
	SpellLoader.add_vanillia_spells()

func _on_scene_change()->void:
	var current_scene=get_tree().current_scene
	if current_scene is MainMenu:
		run_main_menu_additions(current_scene)

func _on_node_added(node:Node)->void:
	if node is Credits:
		var after_playtesters=node.get_node("CreditsContainer/Control4")
		var seperater=Control.new()
		seperater.custom_minimum_size=Vector2(0,50)
		after_playtesters.add_sibling(seperater)
		var mod_credits=load("res://mods/framework/overrides/mod_credits.tscn").instantiate()
		#mod_credits.credit_path="credits/mods"
		after_playtesters.add_sibling(mod_credits)
		var mods_header=load("res://source/ui/credits/credits_header.tscn").instantiate()
		mods_header.key="Mods"
		after_playtesters.add_sibling(mods_header)
		
		# adjust scroll animation
		var credits_container:Control=node.get_node("CreditsContainer")
		var animation:Animation=node.get_node("AnimPlayer").get_animation("roll_credits")
		credits_container.reset_size()
		await get_tree().process_frame
		animation.track_set_key_value(1,1,Vector2(0,-credits_container.size.y-15))

func run_main_menu_additions(main_menu:MainMenu):
	# Add mod section the settings menu
	var settings_menu_panel=main_menu.get_node("HUD/SettingsMenu/OptionsMenu/PositionRoot/Panel")
	mod_settings_menu=load("res://mods/framework/mod_settings_menu.tscn").instantiate()
	mod_settings_menu.visible=false
	
	
	settings_menu_panel.get_node("SectionedPanel/MainMask/MarginContainer/ScrollContainer/MarginContainer/ContentsBox/Game").add_sibling(mod_settings_menu)
	var tab_info:=TabInfo.new()
	tab_info.string_key="menu/settings/mods"
	tab_info.tab_control=mod_settings_menu.get_path()
	var tab_controller:TabController=settings_menu_panel.get_node("Control/TabController")
	tab_controller.tab_definitions.append(tab_info)
	if tab_controller.is_node_ready():
		tab_controller.update()
	
	# change charactor select script
	var character_selector=main_menu.get_node("HUD/CharacterSelect/CharacterSelector")
	change_script_and_copy_properties(character_selector,load("res://mods/framework/overrides/character_selector.gd"))
	
	# make character icon scroll
	var icon_container_scroll=ScrollContainer.new()
	icon_container_scroll.custom_minimum_size.x=160
	icon_container_scroll.get_h_scroll_bar().custom_maximum_size.y=4
	icon_container_scroll.vertical_scroll_mode=ScrollContainer.SCROLL_MODE_DISABLED
	icon_container_scroll.add_theme_constant_override(&"scrollbar_v_separation",-4)
	
	var icon_selector:IconSelector=character_selector.get_node("PositionRoot/Panel/MarginContainer/HBoxContainer/VBoxContainer2/IconSelector")
	var icon_container=icon_selector.get_node("IconContainer")
	
	var add_scroll_container=func ():
		icon_selector.add_child(icon_container_scroll)
		icon_container.reparent(icon_container_scroll)
		icon_selector.move_child(icon_container_scroll,1)
	
	if icon_selector.is_node_ready():
		add_scroll_container.call()
	else:
		icon_selector.ready.connect(add_scroll_container)
	
	icon_selector.selected.connect(func (icon):
		icon_container_scroll.ensure_control_visible(icon)
	)
	
	var difficulty_selector=main_menu.get_node("HUD/CharacterSelect/DifficultySelector")
	change_script_and_copy_properties(difficulty_selector,load("res://mods/framework/overrides/difficulty_selector.gd"))

	main_menu.get_node("HUD/PlayMenu/ContinueButton/HoverOffset/Panel/MarginContainer/VBoxContainer/TopContainer/RunIcons/Control2/CharacterIcon")\
	.set_script(load("res://mods/framework/overrides/character_icon.gd"))
	
	var phonebook=main_menu.get_node("HUD/Phonebook")
	var phonebook_selector=phonebook.get_node("PositionRoot/Panel/MarginContainer/Clip/HBoxContainer/MarginContainer/PhonebookSelector")
	
	
	if phonebook_selector.is_node_ready():
		for child in phonebook_selector.vertical_container.get_children():
			child.queue_free()
		phonebook_selector.set_script(\
			load("res://mods/framework/overrides/phonebook_selector.gd"))
		phonebook_selector._ready()
	else:
		phonebook_selector.set_script(\
			load("res://mods/framework/overrides/phonebook_selector.gd"))
	
	

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
	tree.scene_changed.connect(_on_scene_change)
	tree.node_added.connect(_on_node_added)
	var current_scene=get_tree().current_scene
	if current_scene is MainMenu:
		run_main_menu_additions(current_scene)
	print("loaded spell framework")
	if pronoun_palace_version!=ProjectSettings.get_setting("application/config/version"):
		push_warning("The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+") may be incompatible with this version of the framework for "+pronoun_palace_version+". proceed at you own risk")
		if not OS.is_debug_build():
			var popup=load("res://mods/framework/incompatible_version_popup.tscn").instantiate()
			popup.get_node("Label").text="The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+")\nmay be incompatible with this version of the framework for "+pronoun_palace_version+"\nproceed at you own risk"
			add_child(popup)
	await tree.process_frame
	Globals.set_script(load("res://mods/framework/overrides/custom_globals.gd"))
	await tree.create_timer(0.5).timeout
	change_script_and_copy_properties(Game,load("res://mods/framework/overrides/custom_game.gd"))

func load_save_data(data: Dictionary):
	CharacterLoader.save_data=data.get("character",{})
	CharacterLoader.save_data.merge(CharacterLoader.default_save_data)


func get_save_data() -> Dictionary:
	return {
		character=CharacterLoader.save_data
	}
