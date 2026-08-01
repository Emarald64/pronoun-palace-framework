extends Tile

func get_deboss_color():
	const TILE_DEBOSS_COLOR = Globals.TILE_DEBOSS_COLOR

	for status in get_statuses():
		if status.id != TileStatus.DEFAULT and status.id in TILE_DEBOSS_COLOR:
			return TILE_DEBOSS_COLOR[status.id][type]
		
		if status is CustomStatus and status.deboss_color!=null:
			return status.deboss_color[type%status.deboss_color.size()]

	return TILE_DEBOSS_COLOR[TileStatus.DEFAULT][type]

func get_value(for_face = false) -> int:
	if not for_face and contains_wildcard() and wildcard_faces.is_empty():
		return 0

	var tile_value = Letters.get_face_value(faces, wildcard_faces)

	if (has_status(TileStatus.POOP) or has_status(TileStatus.MONEY) or has_faceless_status()) and not for_face:
		tile_value = 0
	elif has_status(TileStatus.ENHANCED):
		tile_value += 1

	for status in get_statuses():
		if status is CustomStatus:
			tile_value=status.get_tile_value(tile_value)

	if word_builder != null:
		tile_value *= word_builder.get_tile_multiplier(self)

	return tile_value
