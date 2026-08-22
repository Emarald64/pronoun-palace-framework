@tool
#class_name TileSprite
extends "res://source/tile/tile_sprite.gd"

func get_wood_texture() -> Texture2D:
	var tile:Tile= get_node("../../..")
	for status in tile.statuses.values():
		if status is CustomStatus and not status.face_status:
			if is_fish and not status.wood_fish_textures.is_empty():
				set_frames()
				var fish_varients=status.wood_fish_textures[1 if is_flipped else 0]
				return fish_varients[wood_variant%fish_varients.size()]
			elif not status.wood_textures.is_empty():
				set_frames()
				return status.wood_textures[wood_variant%status.wood_textures.size()]
	
	set_frames(true)
	return super()

func get_plastic_texture() -> Texture2D:
	var tile:Tile= get_node("../../..")
	for status in tile.statuses.values():
		if status is CustomStatus and not status.face_status:
			if is_fish:
				set_frames()
				return status.plastic_fish_textures[1 if is_flipped else 0]
			elif status.plastic_texture!=null:
				set_frames()
				return status.plastic_texture
	
	set_frames(true)
	return super()

func set_frames(reset:=false)->void:
	var h:=1
	var v:=1
	if reset:
		h=10
		v=4
	base_sprite.hframes=h
	bomb_overlay.hframes=h
	tile_overlay.hframes=h
	bruise_overlay.hframes=h
	base_sprite.vframes=v
	bomb_overlay.vframes=v
	tile_overlay.vframes=v
	bruise_overlay.vframes=v
