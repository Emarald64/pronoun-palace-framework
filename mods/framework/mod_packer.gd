@tool
extends EditorScript


var files: Array[String] = [
 "res://mods/framework/mod.tscn",
 "res://mods/framework/mod.gd",
 "res://mods/framework/incompatible_version_popup.tscn",
 "res://mods/framework/overrides/custom_globals.gd",
 "res://mods/framework/overrides/main.tscn",
 "res://mods/framework/overrides/custom_main.gd",
 "res://mods/framework/overrides/custom_game.gd",
 #"res://source/globals/enemies.gd",
 "res://source/spell/spell_data.gd",
 "res://mods/framework/enemy_loader.gd",
 #"res://mods/spell_framework/script_overrides/phonebook_selector.gd"
]


func _run() -> void :
 var packer: = PCKPacker.new()
 packer.pck_start("res://mod_packs/framework/framework.pck")
 for file in files:
  if ResourceLoader.exists(file):
   var loaded: Resource = ResourceLoader.load(file)
   if loaded is CompressedTexture2D:
    packer.add_file(loaded.load_path, loaded.load_path)
    packer.add_file(file + ".import", file + ".import")
   else:
    packer.add_file(file, file)
  else:
   packer.add_file(file, file)

 packer.flush()
