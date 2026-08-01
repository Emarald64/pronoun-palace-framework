extends TileBoard

func _init()->void:
	print("loaded custom tile scene")
	tile_scene=preload("res://mods/framework/overrides/tile.tscn")
	super._init()

func trigger_screw():
	await super()
	var custom_statuses:Dictionary[String,CustomStatus]={}
	for tile in get_tiles():
		for status_id in tile.statuses:
			if tile.statuses[status_id] is CustomStatus and status_id not in custom_statuses:
				custom_statuses[status_id]=tile.statuses[status_id]
	
	for status:CustomStatus in custom_statuses.values():
		status.trigger(self)
