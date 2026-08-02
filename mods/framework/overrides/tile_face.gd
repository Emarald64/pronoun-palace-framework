extends TileFace

@onready var tile=get_node("../../../..")

func update_visual(call_face = true):
	super(call_face)
	var type_color_index: int = 0 if type == TileType.DAMAGE else 1
	for status in tile.get_statuses():
		if status is CustomStatus:
			var face_color
			if not status.face_color.is_empty():
				face_color=status.face_color[type_color_index%status.face_color.size()]
				set_color(face_color)

			if not status.value_color.is_empty():
				value_color = status.value_color[type_color_index%status.value_color.size()]
			elif face_color!=null:
				value_color=face_color

func alter_face_text(text: String) -> String:
	for status in tile.get_statuses():
		if status is CustomStatus:
			text=status.get_tile_face(text)

	return super(text)
