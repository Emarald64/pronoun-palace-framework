@tool
extends TileFace

func update_visual(call_face = true):
	super(call_face)
	var type_color_index: int = 0 if type == TileType.DAMAGE else 1
	for status in statuses:
		if status in TileStatusLoader.tile_face_color:
			set_color(TileStatusLoader.tile_face_color[status][type_color_index])

		if status in TileStatusLoader.tile_value_color:
			value_color = TileStatusLoader.tile_value_color[status][type_color_index]

func alter_face_text(text: String) -> String:
	for status in TileStatusLoader.tile_face_alter_funcs:
		if status in statuses:
			text=TileStatusLoader.tile_face_alter_funcs[status].call(text)

	return super(text)
