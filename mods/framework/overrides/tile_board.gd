extends TileBoard

func _init()->void:
	print("loaded custom tile scene")
	tile_scene=preload("res://mods/framework/overrides/tile.tscn")
	super._init()

func turn_end(reroll = false):
	turn_ended.emit()

	rng.fill.reseed(rng.fill_gen)
	rng.crit.reseed(rng.fill_gen)

	await wait_for_idle_tiles()
	await wait_for_idle()

	await trigger_linked()
	await trigger_coal()
	await trigger_ash()
	await trigger_gay()
	await trigger_poison()
	await trigger_haze()
	await trigger_bleed()
	await trigger_cursed()
	await trigger_eternal()
	await trigger_bomb()
	await trigger_acid()
	await trigger_bottom_acid_tiles(true)
	await trigger_spicy()
	await trigger_frozen()
	await trigger_poop()
	await trigger_screw()
	
	for trigger_func in TileStatusLoader.trigger_funcs:
		await trigger_func.call(self)

	if reroll:
		await reroll_board()
	else:
		await fill_board()

	await wait_for_idle()
