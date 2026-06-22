extends Mod

func _ready() -> void:
	if ResourceLoader.exists("res://mods/framework/mod.gd"):
		load("res://mods/framework/mod.gd").add_spell("foggy_glasses",1000.0,"support")
		var enemy_loader=load("res://mods/framework/enemy_loader.gd")
		enemy_loader.enemy_pools[0][0].clear()
		enemy_loader.add_enemy("paparazzi",0,0,"res://mods/foggy_glasses/paparazzi.png")
		print(enemy_loader.enemy_pools)
		
		var character_loader=load("res://mods/framework/character_loader.gd")
		character_loader.add_character("dew_jubilist",Globals.SPELLS.VERIFICATION_CAN,load("res://mods/foggy_glasses/dew_jubilist_icons.png"))
	else:
		push_error("foggy glasses mod requires the spell framework to work. Download it here: https://github.com/Emarald64/pronoun-palace-framework")
