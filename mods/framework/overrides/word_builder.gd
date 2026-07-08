extends "res://source/word_builder/word_builder.gd"

#func get_tile_multiplier(tile: Tile) -> int:
	#var mult:=1.0
	#for status_id in TileStatusLoader.tile_value_multiplier_functions:
		#if tile.has_status(status_id):
			#mult*=TileStatusLoader.tile_value_multiplier_functions[status_id].call(tile)
	#return super(tile)*mult

func update_stats() -> void :
	var words: = get_words()
	intent_container.reset_intents()

	reset_stats()

	updating_stats.emit(words)

	intent_tiles = {}
	intent_value = {}

	invalidating_tiles = []

	var warnings: Dictionary = {}

	var shimmering_tiles = []
	var link_color_tiles = {}
	for tile: Tile in tiles:
		var value: = tile.get_value()
		var frozen: = tile.has_status(TileStatus.FROZEN)

		if tile.has_value():
			if tile.type == TileType.DAMAGE or frozen:
				add_intent_tile(Intent.DAMAGE, tile)
				damage += value

			if tile.type == TileType.DEFENSE or frozen:
				add_intent_tile(Intent.DEFENSE, tile)
				defense += value

			if tile.has_status(TileStatus.CANDY):
				add_intent_tile(Intent.HEAL, tile)
				self_heal += value

			var slot_data: Variant = get_tile_slot_data(tile)
			if slot_data == -99:
				add_intent_tile(Intent.SPIKED_SLOTS, tile)
				slot_damage += value

		var is_crit: = tile.has_status(TileStatus.CRIT)
		var bomb_status = tile.get_status(TileStatus.BOMB)
		if bomb_status:
			is_crit = bomb_status.turns == 1

		if is_crit:
			var crit_addition: float = Game.balance.crit_value - 1
			if tile.type == TileType.DAMAGE:
				add_intent_tile(Intent.DAMAGE_MULTIPLIER, tile)
				damage_multiplier += crit_addition
			else:
				add_intent_tile(Intent.DEFENSE_MULTIPLIER, tile)
				defense_multiplier += crit_addition

		if tile.is_shimmering():
			shimmering_tiles.append(tile)

		var bruise_status: = tile.get_status(TileStatus.BRUISE)
		if bruise_status:
			add_intent_tile(Intent.BRUISE, tile)
			var status_value = max(value, 1) + Game.balance.status_added_value
			bruise += status_value

		var period: = tile.get_status(TileStatus.PERIOD)
		if period and period.invalidates_word():
			add_warning_tile(warnings, WARNINGS.PERIOD, tile)

		var capital: = tile.get_status(TileStatus.CAPITAL)
		if capital and capital.invalidates_word():
			add_warning_tile(warnings, WARNINGS.CAPITAL, tile)

		var linked: = tile.get_status(TileStatus.LINKED)
		if linked:
			link_color_tiles.get_or_add(linked.link_id, []).append(tile)

		var gay: = tile.get_status(TileStatus.GAY)
		if gay and gay.invalidates_word():
			add_warning_tile(warnings, WARNINGS.STRAIGHT, tile)
		
		for status_id in TileStatusLoader.word_affects:
			var status := tile.get_status(status_id)
			if status:
				TileStatusLoader.word_affects[status_id].call(status,self)

	var invalidated_linked_count: int = 0
	var invalidated_linked_colors = {}
	var board_tiles = tile_board.get_tiles({sorted = true, in_word = false})
	for tile: Tile in board_tiles:
		var linked: = tile.get_status(TileStatus.LINKED)
		if linked and linked.link_id in link_color_tiles:
			invalidated_linked_count += 1
			invalidated_linked_colors[linked.link_id] = true
			link_color_tiles[linked.link_id].append(tile)

		if tile.has_status(TileStatus.DEFAULT):
			continue

		var poison: = tile.get_status(TileStatus.POISON)
		if poison:
			add_intent_tile(Intent.POISON, tile, poison.get_status_value())

		var bleed: = tile.get_status(TileStatus.BLEED)
		if bleed:
			add_intent_tile(Intent.BLEED, tile, Game.balance.bleed_damage)

		var cursed: = tile.get_status(TileStatus.CURSED)
		if cursed:
			add_intent_tile(Intent.CURSED, tile, cursed.get_status_value())

		var eternal: = tile.get_status(TileStatus.ETERNAL)
		if eternal and not eternal.played_this_turn:
			add_intent_tile(Intent.ETERNAL, tile, eternal.get_status_value())

		var acid: = tile.get_status(TileStatus.ACID)
		if acid and acid.will_fall_on_turn_end():
			add_intent_tile(Intent.ACID, tile, acid.get_status_value())

		var bomb: = tile.get_status(TileStatus.BOMB)
		if bomb and bomb.will_explode_on_turn_end():
			add_intent_tile(Intent.BOMB, tile, bomb.get_status_value())

		var haze: = tile.get_status(TileStatus.HAZE)
		if haze:
			add_intent_tile(Intent.HAZE, tile, Game.balance.bleed_damage)
		
		for status_id in TileStatusLoader.board_affects:
			var status := tile.get_status(status_id)
			if status:
				TileStatusLoader.word_affects[status_id].call(status,self)

	tile_defense = int(ceil(defense * defense_multiplier))

	post_tile_stats.emit(words)

	damage = int(ceil(damage * damage_multiplier))
	defense = int(ceil(defense * defense_multiplier))

	is_damaging = damage != 0 or Intent.DAMAGE in intent_tiles
	is_healing = self_heal != 0 or Intent.HEAL in intent_tiles

	if is_damaging:
		add_intent(Intent.DAMAGE, {damage = damage})

	if defense != 0 or Intent.DEFENSE in intent_tiles:
		add_intent(Intent.DEFENSE, {defense = defense})

	if is_healing:
		add_intent(Intent.HEAL, {heal = self_heal})

	if bruise > 0:
		add_intent(Intent.BRUISE, {damage = bruise})

	if slot_damage > 0:
		add_intent(Intent.SPIKED_SLOTS, {damage = slot_damage})

	if damage_multiplier > 1:
		add_intent(Intent.DAMAGE_MULTIPLIER, {multiplier = damage_multiplier})

	if defense_multiplier > 1:
		add_intent(Intent.DEFENSE_MULTIPLIER, {multiplier = defense_multiplier})

	for spell in player.get_spells():
		var spell_damage: int = spell.get_laced_damage()
		if spell_damage > 0:
			laced_damage += spell_damage

	if laced_damage > 0:
		add_intent(Intent.LACED, {damage = laced_damage})

	for intent in SIMPLE_DAMAGE_INTENTS:
		if intent in intent_tiles:
			add_intent(intent, {damage = intent_value[intent]})

	var invalid_link_tiles = []
	var invalid_link_colors = []
	for color in invalidated_linked_colors:
		invalid_link_colors.append(StringManager.get_string("misc/linked_color/" + color))
		for tile in link_color_tiles[color]:
			invalid_link_tiles.append(tile)

	if invalid_link_tiles.size() > 0:
		add_warning(warnings, WARNINGS.LINKED, {invalid_linked = invalidated_linked_count})
		invalidating_tiles.append_array(invalid_link_tiles)

	if repeat_word != "":
		if repeat_word_is_mystery:
			add_warning(warnings, WARNINGS.REPEAT_WORD)
		else:
			add_warning(warnings, WARNINGS.REPEAT_WORD, {word = repeat_word})

	if not words.all_valid and tiles.size() > 0:
		for sub_list in words.sub_lists:
			var has_invalid_mystery: = false
			if not sub_list.all_valid:
				for tile in sub_list.tiles:
					if tile.has_status(TileStatus.MYSTERY):
						has_invalid_mystery = true
						break

			if has_invalid_mystery:
				add_warning(warnings, WARNINGS.MYSTERY)
				break


	var has_warning: = false
	for warning_id in WARNING_PRIORITY:
		if warning_id in warnings:
			has_warning = true
			word_hint.set_warning("misc/word_warnings/" + warning_id, warnings[warning_id])
			break

	if not has_warning:
		word_hint.reset_warning()

	if words.maximum_length > 0 and SaveManager.get_show_crit_chance_enabled():
		if tile_board.crit_chance > 0:
			var player_crit_chance = player.get_crit_chance()
			var crit_bonus = tile_board.calculate_crit_bonus(words.sub_lists)
			var next_chance = tile_board.calculate_added_crit_chance(crit_bonus)
			var is_wildcard: bool = player.crits_are_wildcards()
			var context = {
				chance = "%.1f" % [next_chance * 100.0], 
				bonus = "%.1f" % [player_crit_chance.BONUS_PER_LETTER * 100.0], 
				truncated_chance = "%.0f" % [next_chance * 100.0], 
				natural = player.has_natural_crit_chance(), 
				wildcard = is_wildcard, 
			}
			if is_wildcard:
				context.name_override = "wildcard_chance"

			add_intent(Intent.CRIT_CHANCE, context)

	finished_updating_stats.emit(words)
	intent_container.update_intents(false, true)
