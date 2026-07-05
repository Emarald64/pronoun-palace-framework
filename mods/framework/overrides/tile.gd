extends Tile

func get_deboss_color():
	var TILE_DEBOSS_COLOR = Globals.TILE_DEBOSS_COLOR.merged(TileStatusLoader.tile_deboss_color)

	for status in get_statuses():
		if status.id != TileStatus.DEFAULT and status.id in TILE_DEBOSS_COLOR:
			return TILE_DEBOSS_COLOR[status.id][type]

	return TILE_DEBOSS_COLOR[TileStatus.DEFAULT][type]
