@abstract
class_name CustomStatus
extends Status

static var plastic_texture:Texture2D
static var wood_textures:Array[Texture2D]
static var plastic_fish_textures:Array[Texture2D]
static var wood_fish_textures:Array[Array]
static var face_color:Array[Color]
static var value_color:Array[Color]
static var deboss_color:Array[Color]

func update_frame() -> void :
	if (plastic_texture!=null and tile.type==Globals.TileType.DEFENSE) or (not wood_textures.is_empty() and tile.type==Globals.TileType.DAMAGE):
		tile.tile_sprite.set_frame(0)
		tile.tile_sprite.update_texture()

## Called for every tile with the status in the word builder, whenever the word builder is updated[br]
## Should be used to display intents, modify damage/defense values, or invalidate the word
func word_effect(_word_builder:WordBuilder,_warnings:Dictionary)->void:
	pass

## Called for every tile with the status on the board, whenever the word builder is updated[br]
## Should be used to display intents, modify damage/defense values, or invalidate the word
func board_effect(_word_builder:WordBuilder,_warnings:Dictionary)->void:
	pass

func get_tile_value(current_value:int)->int:
	return current_value

func get_tile_face(current_face:String)->String:
	return current_face

static func trigger(_tile_board:TileBoard)->void:
	pass
