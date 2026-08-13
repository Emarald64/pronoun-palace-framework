#class_name TileBoard
extends "res://source/tile/tile_board.gd"

func _init():
	tile_scene=load("res://mods/framework/overrides/source/tile/tile.tscn")
	super()

func trigger_screw():
	await super()
	var custom_statuses:Dictionary[String,CustomStatus]={}
	for tile in get_tiles():
		for status_id in tile.statuses:
			if tile.statuses[status_id] is CustomStatus and status_id not in custom_statuses:
				custom_statuses[status_id]=tile.statuses[status_id]
	
	for status:CustomStatus in custom_statuses.values():
		await status.board_trigger(self)

#func create_tile() -> Tile:
	#var tile=tile_scene.instantiate()
	#return tile
