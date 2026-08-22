@abstract
class_name CustomStatus
extends Status

## Texture used for plastic tiles
static var plastic_texture:Texture2D
## Textures used for wooden tiles, there are 3 wood variations, though it will work if you have less
static var wood_textures:Array[Texture2D]
## Two textures for plastic fish, the first is the regular one and the second is the flipped one
static var plastic_fish_textures:Array[Texture2D]
## Two arrays of textures, first one for regular fish, second for flipped fish. Each can have up to 3 wood variations, though it will work with less.
static var wood_fish_textures:Array[Array]
## The color of the text on the tile. The first color is for wood tiles, and the second is for plastic tiles. If value color is empty, these colors will also be used for the value number
static var face_color:Array[Color]
## The color of the value of the tile. The first color is for wood tiles, and the second is for plastic tiles. If empty, the face colors will be used for the value.
static var value_color:Array[Color]
## The color of the shadow under the face text. The first color is for wood tiles and the second is for plastic tiles.
static var deboss_color:Array[Color]

func update_frame() -> void :
	if face_status:
		super.update_frame()
	else:
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

## Change the value of a tile with this effect
func get_tile_value(current_value:int)->int:
	return current_value

## Change how the face displays on the tile. This does not affect how it is treated for forming words
func get_tile_face(current_face:String)->String:
	return current_face

## Called one if a tile with this effect is on the board when a word is submitted. Can be used to for example damage the player for effects like poison, remove the tile from the board, or remove the status from the tiles
static func board_trigger(_tile_board:TileBoard)->void:
	pass

## Called if a tile with this effect is in the word when it is submitted. Can be used to for example damage or heal the player when the tile is played
static func word_trigger(_word_builder:WordBuilder)->void:
	pass

## Called near the end of the word builder updating stats so intents can be added
static func add_intents(_word_builder:WordBuilder)->void:
	pass
