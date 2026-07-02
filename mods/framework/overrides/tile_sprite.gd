extends TileSprite

func get_wood_texture() -> Texture2D:
	var tile:Tile= get_node("../../..")
	for status in TileStatusLoader.plastic_textures:
		if tile.has_status(status):
			set_frames()
			var status_wood_textures:=TileStatusLoader.wood_textures[status]
			return status_wood_textures[wood_variant%len(status_wood_textures)]
	
	set_frames(true)
	if is_fish:
		if is_flipped:
			return ResourceLoader.load(get_fish_folder() + "wood_fish_" + WOOD_VARIANTS[wood_variant] + "_flipped.png")
		else:
			return ResourceLoader.load(get_fish_folder() + "wood_fish_" + WOOD_VARIANTS[wood_variant] + ".png")
	else:
		return WOOD_TEXTURES[wood_variant]

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

func get_plastic_texture() -> Texture2D:
	var tile:Tile= get_node("../../..")
	for status in TileStatusLoader.plastic_textures:
		if tile.has_status(status):
			set_frames()
			return TileStatusLoader.plastic_textures[status]
	
	set_frames(true)
	if is_fish:
		if is_flipped:
			return ResourceLoader.load(get_fish_folder() + "plastic_fish_flipped.png")
		else:
			return ResourceLoader.load(get_fish_folder() + "plastic_fish.png")
	else:
		return PLASTIC_TEXTURE
