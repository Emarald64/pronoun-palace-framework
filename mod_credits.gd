extends VBoxContainer

var primary_credits_scene:PackedScene=load("res://source/ui/credits/primary_credits.tscn")
var credits_header_scene:PackedScene=load("res://source/ui/credits/credits_header.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for mod:ModData in ModLoader.get_all_mods():
		if StringManager.has_string_group("mod/"+mod.id+"/credits"):
			var title=credits_header_scene.instantiate()
			title.key="mod/"+mod.id+"/name"
			title.bbcode_enabled=true
			add_child(title)
			
			var credits=primary_credits_scene.instantiate()
			credits.credit_path="mod/"+mod.id+"/credits"
			add_child(credits)
			add_spacer(false)
