extends TileModifierSpell

enum {
	INVERT, 
	CRIT
}

var state = INVERT
var inverted_tile: Tile


func get_tooltip_context():
	return {invert = state == INVERT}

func set_status_tooltips():
	status_tooltips = ["negative", TileStatus.CRIT]

func apply_to_tile(tile: Tile, _real_tile: Tile, is_preview: bool, _is_preview_update: bool) -> void :
	if state==INVERT:
		tile.add_status("negative")
		if not is_preview:
			print("inverter applyed negative")
			state=CRIT
			tile.add_poofcloud(Globals.COLORS.INK_BLACK,tile.get_color())
	else:
		tile.add_status(Globals.TileStatus.CRIT)
		if not is_preview:
			print("inverter applyed crit")
			state=INVERT
			tile.add_poofcloud(tile.get_color())
	

	if not is_preview:
		tile.animation.play("pressed")


func is_tile_selectable(tile: Tile) -> bool:
	return not tile.has_harmful_status() and (state!=CRIT or not tile.has_status(TileStatus.CRIT))

func get_save_data():
	var save =super()
	save.state=state
	return save

func load_save_data(save):
	super.load_save_data(save)
	state = save.get("state", INVERT)
