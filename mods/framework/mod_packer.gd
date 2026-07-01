@tool
extends EditorScript


var additional_files: PackedStringArray = [
	"res://source/spell/spell_data.gd",
	"res://strings/menu/settings.txt",
]


func _run() -> void :
	var packer: = PCKPacker.new()
	packer.pck_start("res://mod_packs/framework/framework.pck")
	var mod_files=Util.get_file_paths_recursive("res://mods/framework")
	#print(mod_files+additional_files)
	for file in mod_files+additional_files:
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
