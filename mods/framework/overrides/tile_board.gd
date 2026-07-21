extends TileBoard

func _init()->void:
	print("loaded custom tile scene")
	tile_scene=preload("res://mods/framework/overrides/tile.tscn")
	super._init()

func trigger_screw():
	await super()
	for trigger_func in TileStatusLoader.trigger_funcs:
		await trigger_func.call(self)
