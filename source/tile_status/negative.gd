extends Status

func update_frame() -> void :
	var frame = 0
	tile.tile_sprite.set_frame(frame)
	tile.tile_sprite.update_texture()

static func tile_value_multiplier(_tile:Tile)->float:
	return -1

#static func word_affect(status:Status,word_builder:Node2D) ->void:
	#if status.tile.is_type(Globals.TileType.DAMAGE):
		#word_builder.damage-=2*status.get_status_value()
	#else:
		#word_builder.defence-=2*status.get_status_value()
