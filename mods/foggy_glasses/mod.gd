extends Mod

var remove_other_enemies:=true
var exisiting_enemy_pool:Array[String]
#var enemy_loader
#var framework

func generate_mod_settings_page()->Control:
	# instantiate settings page
	var mod_settings_page=load("res://mods/framework/mod_options.tscn").instantiate()
	
	# set the page's array of options
	mod_settings_page.options=[
		{name="Remove Other Enemies",type=Variant.Type.TYPE_BOOL},
		{name="Smol Aqua",type=Variant.Type.TYPE_BOOL}
		]
		
	# connect functions to get and set option values
	mod_settings_page.option_changed.connect(_on_options_updated)
	mod_settings_page.get_setting_method=get_option_value
	
	# generate the layout for the settings page
	mod_settings_page.set_layout()
	return mod_settings_page

func _ready() -> void:
	#SpellLoader.add_spell("foggy_glasses",1000.0,"support")
	SpellLoader.add_spell("inverter",1000.0,"support")
	
	# add menu to mod settings menu
	ModSettings.add_menu("Foggy Glasses Mod",generate_mod_settings_page)
	
	# add dew jubilist character
	CharacterLoader.add_character("dew_jubilist",Globals.SPELLS.VERIFICATION_CAN,load("res://mods/foggy_glasses/dew_jubilist_icons.png"))
	
	# add custom intent for aqua
	CustomIntent.custom_intent_icons["slash_wood"]=load("res://mods/foggy_glasses/pronounpalace-slashtiletype-px.png")

	TileStatusLoader.add_tile_status("negative",preload("res://mods/foggy_glasses/inverted_pastic_tile.png"),preload("res://mods/foggy_glasses/inverted_wood_tile.png"))
	TileStatusLoader.tile_face_color["negative"]=[Color.WHITE,Color.WHITE]
	TileStatusLoader.tile_value_color["negative"]=[Color.WHITE,Color.WHITE]
	TileStatusLoader.tile_value_multiplier_functions["negative"]=preload("res://source/tile_status/negative.gd").tile_value_multiplier
	
func update_remove_other_enemies():
	if exisiting_enemy_pool==null:
		exisiting_enemy_pool=EnemyLoader.enemy_pools[0][0]
	
	if remove_other_enemies:
		EnemyLoader.enemy_pools[0][0].clear()
	else:
		for enemy in Enemies.POOLS[0][0]:
			if enemy not in EnemyLoader.enemy_pools[0][0]:
				EnemyLoader.enemy_pools[0][0].append(enemy)
	if "aqua" not in EnemyLoader.enemy_pools[0][0]:
		EnemyLoader.add_enemy("aqua",0,0,"res://mods/foggy_glasses/aqua/miniface_aqua.png")

func _on_options_updated(option_name:String,value):
	match option_name:
		"Remove Other Enemies":
			remove_other_enemies=value
			update_remove_other_enemies()
		"Smol Aqua":
			preload("res://source/enemies/sprites/aqua_sprite.gd").smol=value

func get_option_value(option_name:String):
	match option_name:
		"Remove Other Enemies":
			return remove_other_enemies
		"Smol Aqua":
			return preload("res://source/enemies/sprites/aqua_sprite.gd").smol
		"test selector":
			return "option1"

func load_save_data(data: Dictionary) -> void:
	remove_other_enemies=data.get("remove_other_enemies",false)
	preload("res://source/enemies/sprites/aqua_sprite.gd").smol=data.get("smol_aqua",false)
	update_remove_other_enemies()

func get_save_data() -> Dictionary:
	return {
		remove_other_enemies=remove_other_enemies,
		smol_aqua=preload("res://source/enemies/sprites/aqua_sprite.gd").smol,
		}
