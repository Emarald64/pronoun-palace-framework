@tool
extends EditorScript

var mod_id="foggy_glasses"
var zip_pack:=false

var files: Array[String] = [
	"res://mods/foggy_glasses/mod.tscn",
	"res://mods/foggy_glasses/mod.gd",
	
	#foggy glasses spell
	"res://strings/spell/foggy_glasses.txt",
	"res://source/spells/foggy_glasses.gd",
	
	# inverter spell
	"res://source/spells/inverter.gd",#inverter script
	"res://strings/spell/inverter.txt",# inverter strings
	
	"res://source/tile_status/negative.gd",# negative affect script
	"res://strings/status/negative.txt",# negative affect strings
	
	# negative tile sprites
	"res://mods/foggy_glasses/inverted_pastic_tile.png",
	"res://mods/foggy_glasses/inverted_wood_tile.png",
	
	#aqua enemy
	"res://source/enemies/aqua.tscn", # aqua enemy scene
	"res://source/enemies/aqua.gd", # aqua enemy script
	"res://arte/enemies/aqua_body.png", # aqua body sprite
	"res://arte/enemies/aqua_knife_ready.png", # aqua held knife sprite
	"res://source/enemies/sprites/aqua_sprite.tscn", # aqua sprite scene
	"res://source/enemies/sprites/aqua_sprite.gd", # aqua sprite script
	"res://strings/enemy/aqua.txt", # aqua strings
	"res://mods/foggy_glasses/aqua/AquaKnifeProjectile.tscn", #aqua knife projectile scene
	"res://mods/foggy_glasses/aqua/aqua_knife_projectile.gd", # aqua knife projectile script
	"res://mods/foggy_glasses/aqua/miniface_aqua.png", # aqua phonebook icon
	"res://mods/foggy_glasses/aqua/knife_spin.png",
	"res://mods/foggy_glasses/aqua/knife_fly.png",
	"res://mods/foggy_glasses/aqua/swing.wav",
	"res://mods/foggy_glasses/aqua/swing.wav.import",
	"res://mods/foggy_glasses/aqua/miniboss_new_section_idea_wip.ogg", #aqua fight musi
	"res://mods/foggy_glasses/aqua/miniboss_new_section_idea_wip.ogg.import", #aqua fight musi
	# aqua's chain knives
	"res://mods/foggy_glasses/aqua/chain_knives.tscn",
	"res://mods/foggy_glasses/aqua/chain_knives.gd",
	"res://mods/foggy_glasses/aqua/chain_knives_pair.gd",
	"res://mods/foggy_glasses/aqua/chainswing_arms.png",
	"res://mods/foggy_glasses/aqua/chainswing_arms.gd",
	# wooden slash intent
	"res://mods/foggy_glasses/pronounpalace-slashtiletype-px.png", #wooden slash intent icon
	"res://strings/intent/slash_wood.txt", #wood slash intent strings
	
	# dew jubilist character
	"res://mods/foggy_glasses/dew_jubilist_icons.png",
	"res://arte/characters/dew_jubilist.png",
	"res://arte/characters/dew_jubilist_trans.png",
	"res://source/characters/sprites/dew_jubilist_sprite.tscn",
	"res://source/characters/dew_jubilist.gd",
	"res://source/characters/dew_jubilist.tscn",
	"res://strings/character/dew_jubilist.txt",
	"res://source/spells/dew_jubilist_verification_can.gd",
	"res://arte/spells/dew_jubilist_verification_can.png",
	"res://strings/spell/dew_jubilist_verification_can.txt"
]


func _run() -> void :
	var packer
	if zip_pack:
		packer=ZIPPacker.new()
		packer.open("res://mod_packs/"+mod_id+"/"+mod_id+".zip")
	else:
		packer = PCKPacker.new()
		packer.pck_start("res://mod_packs/"+mod_id+"/"+mod_id+".pck")
	# automaticcly includes files in your mod's folder
	for file in files:
		if ResourceLoader.exists(file):
			var loaded: Resource = ResourceLoader.load(file)
			if loaded is CompressedTexture2D:
				if zip_pack:
					add_file_to_zip(packer,loaded.load_path)
					add_file_to_zip(packer,file + ".import")
				else:
					packer.add_file(loaded.load_path, loaded.load_path)
					packer.add_file(file + ".import", file + ".import")
			elif loaded is AudioStream:
				var config:=ConfigFile.new()
				config.load(file + ".import")
				var imported_path=config.get_value("remap","path")
				if zip_pack:
					add_file_to_zip(packer,file + ".import")
					add_file_to_zip(packer,imported_path)
				else:
					packer.add_file(file + ".import", file + ".import")
					packer.add_file(imported_path, imported_path)
			else:
				if zip_pack:
					add_file_to_zip(packer,file)
				else:
					packer.add_file(file, file)
		else:
			if zip_pack:
				add_file_to_zip(packer,file)
			else:
				packer.add_file(file, file)
	
	if zip_pack:
		packer.close()
	else:
		packer.flush()

static func add_file_to_zip(packer:ZIPPacker,path:String):
	packer.start_file(path)
	packer.write_file(FileAccess.get_file_as_bytes(path))
	packer.close_file()
