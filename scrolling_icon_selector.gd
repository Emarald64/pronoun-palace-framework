extends IconSelector

func _ready() -> void:
	var icon_container_scroll=ScrollContainer.new()
	icon_container_scroll.custom_minimum_size.x=160
	icon_container_scroll.get_h_scroll_bar().custom_maximum_size.y=4
	icon_container_scroll.vertical_scroll_mode=ScrollContainer.SCROLL_MODE_DISABLED
	icon_container_scroll.add_theme_constant_override(&"scrollbar_v_separation",-4)
	
	add_child(icon_container_scroll)
	container.reparent(icon_container_scroll)
	move_child(icon_container_scroll,1)
	
	selected.connect(icon_container_scroll.ensure_control_visible)
	
