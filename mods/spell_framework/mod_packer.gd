@tool
extends EditorScript


var files: Array[String] = [
 "res://mods/spell_framework/mod.tscn",
 "res://mods/spell_framework/mod.gd",
 "res://mods/spell_framework/incompatible_version_popup.tscn",
 "res://mods/spell_framework/custom_globals.gd",
 #"res://override.cfg",
 "res://source/spell/spell_data.gd"
]


func _run() -> void :
 var packer: = PCKPacker.new()
 packer.pck_start("res://mod_packs/spell_framework/spell_framework.pck")
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
