extends CustomStatus

static func _static_init() -> void:
	face_color=[Color.WHITE,Color.WHITE]
	deboss_color=[Color("08235b"),Color("382932")]
	wood_textures=[preload("res://mods/foggy_glasses/negative tile sprites/inverted_wood_tile.png")]
	plastic_texture=preload("res://mods/foggy_glasses/negative tile sprites/inverted_plastic_tile.png")
	wood_fish_textures=[[preload("res://mods/foggy_glasses/negative tile sprites/inverted_wood_fish_flipped.png")],[preload("res://mods/foggy_glasses/negative tile sprites/inverted_wood_fish.png")]]
	plastic_fish_textures=[preload("res://mods/foggy_glasses/negative tile sprites/inverted_plastic_fish_flipped.png"),preload("res://mods/foggy_glasses/negative tile sprites/inverted_plastic_fish.png")]

	
func get_tile_value(current_value:int)->int:
	return -current_value
