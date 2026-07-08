extends Tile

func get_deboss_color():
	var TILE_DEBOSS_COLOR = Globals.TILE_DEBOSS_COLOR.merged(TileStatusLoader.tile_deboss_color)

	for status in get_statuses():
		if status.id != TileStatus.DEFAULT and status.id in TILE_DEBOSS_COLOR:
			return TILE_DEBOSS_COLOR[status.id][type]

	return TILE_DEBOSS_COLOR[TileStatus.DEFAULT][type]

func get_value(for_face = false) -> int:
	if not for_face and contains_wildcard() and wildcard_faces.is_empty():
		return 0

	var tile_value = Letters.get_face_value(faces, wildcard_faces)

	if (has_status(TileStatus.POOP) or has_status(TileStatus.MONEY) or has_faceless_status()) and not for_face:
		tile_value = 0
	elif has_status(TileStatus.ENHANCED):
		tile_value += 1

	for status_id in TileStatusLoader.tile_value_modifier_functions:
		var status=get_status(status_id)
		if status!=null:
			tile_value=TileStatusLoader.tile_value_modifier_functions[status_id].call(status,tile_value)

	if word_builder != null:
		tile_value *= word_builder.get_tile_multiplier(self)

	return tile_value
