@tool
extends EditorScript


var files: Array[String] = [
 "res://mods/foggy_glasses/mod.tscn",
 "res://mods/foggy_glasses/mod.gd",
 "res://strings/spell/foggy_glasses.txt",
 "res://source/spells/foggy_glasses.gd",

 "res://source/enemies/paparazzi.tscn",
 "res://arte/enemies/paparazzi.png",
 "res://source/enemies/sprites/paparazzi_sprite.tscn",
 "res://source/enemies/paparazzi.gd",
 "res://source/enemies/paparazzi.tscn",
 "res://strings/enemy/paparazzi.txt"
]


func _run() -> void :
 var packer: = PCKPacker.new()
 packer.pck_start("res://mod_packs/foggy_glasses/foggy_glasses.pck")
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
