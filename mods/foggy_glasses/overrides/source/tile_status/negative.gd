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

func word_effect(_word_builder:WordBuilder,_warnings:Dictionary)->void:
	print("negative word effect")

func board_effect(_word_builder:WordBuilder,_warnings:Dictionary)->void:
	print("negative board effect")

static func board_trigger(_tile_board:TileBoard)->void:
	print("negative board trigger")

static func word_trigger(_word_builder:WordBuilder)->void:
	print("negative word trigger")
