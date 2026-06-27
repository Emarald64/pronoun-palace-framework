extends Mod

var remove_other_enemies:=true
var exisiting_enemy_pool:Array[String]
var enemy_loader
var framework

func generate_mod_settings_page()->Control:
	var mod_settings_page=load("res://mods/framework/mod_options.tscn").instantiate()
	mod_settings_page.options=[
		{name="Remove Other Enemies",type=Variant.Type.TYPE_BOOL},
		{name="test selector",type=Variant.Type.TYPE_STRING,options=["option1","option2"]}
		]
	mod_settings_page.option_changed.connect(_on_options_updated)
	mod_settings_page.get_setting_method=get_option_value
	mod_settings_page.set_layout()
	return mod_settings_page

func _ready() -> void:
	if ResourceLoader.exists("res://mods/framework/mod.gd"):
		enemy_loader=load("res://mods/framework/enemy_loader.gd")
		framework=load("res://mods/framework/mod.gd")
		framework.add_spell("foggy_glasses",1000.0,"support")
		
		var mod_settings_menu=load("res://mods/framework/mod_settings_menu.gd")
		
		mod_settings_menu.add_menu("Foggy Glasses Mod",generate_mod_settings_page)
		
		var character_loader=load("res://mods/framework/character_loader.gd")
		character_loader.add_character("dew_jubilist",Globals.SPELLS.VERIFICATION_CAN,load("res://mods/foggy_glasses/dew_jubilist_icons.png"))
	else:
		push_error("foggy glasses mod requires the spell framework to work. Download it here: https://github.com/Emarald64/pronoun-palace-framework")

func update_remove_other_enemies():
	if exisiting_enemy_pool==null:
		exisiting_enemy_pool=enemy_loader.enemy_pools[0][0]
	
	if remove_other_enemies:
		enemy_loader.enemy_pools[0][0].clear()
	else:
		for enemy in Enemies.POOLS[0][0].duplicate():
			if enemy not in enemy_loader.enemy_pools[0][0]:
				enemy_loader.enemy_pools[0][0].append(enemy)
	enemy_loader.add_enemy("paparazzi",0,0,"res://mods/foggy_glasses/paparazzi.png")

func _on_options_updated(option_name:String,value):
	match option_name:
		"Remove Other Enemies":
			remove_other_enemies=value
			update_remove_other_enemies()

func get_option_value(option_name:String):
	match option_name:
		"Remove Other Enemies":
			return remove_other_enemies
		"test selector":
			return "option2"

func load_save_data(data: Dictionary) -> void:
	remove_other_enemies=data.remove_other_enemies
	update_remove_other_enemies()

func get_save_data() -> Dictionary:
	return {remove_other_enemies=remove_other_enemies}
