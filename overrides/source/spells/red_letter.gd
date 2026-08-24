#class_name RedLetterSpell
extends "res://source/spells/red_letter.gd"


func _use():
	var upgrading_spell: = await get_upgrading_spell()
	if upgrading_spell != null:
		upgrade_spell(upgrading_spell)
		player_spell_slot.despawn()

	_post_use()


func get_tooltip_context():
	var context = super.get_tooltip_context()
	if Game.is_in_run():
		context.character = Game.player.id

	return context


func get_spell_convert_from_id(spell: Spell) -> String:
	if spell.id in CharacterLoader.custom_spell_upgrades:
		return spell.id
	elif spell.secret_id in CharacterLoader.custom_spell_upgrades:
		return spell.secret_id
	else:
		return ""


func track_red_letter_upgrades_found() -> void :
	var save: = SaveManager.get_save()
	for other_spell in Game.player.get_spells():
		if other_spell.just_added:
			continue

		var other_convert_from_id: = get_spell_convert_from_id(other_spell)
		if other_convert_from_id != "":
			save.track_spell_found(CharacterLoader.custom_spell_upgrades[other_convert_from_id], Game.difficulty)


func upgrade_spell(spell: Spell) -> void :
	var convert_from_id: = get_spell_convert_from_id(spell)
	if convert_from_id == "":
		return

	if AchievementManager.should_track_stats():
		track_red_letter_upgrades_found()
		SaveManager.get_save().track_spell_taken(CharacterLoader.custom_spell_upgrades[convert_from_id], Game.difficulty)

	spell.transform_spell(CharacterLoader.custom_spell_upgrades[convert_from_id], not convert_from_id in Globals.GIFTS)


func get_upgrading_spell() -> Spell:
	var convertible_spells: Array[Spell] = []
	for spell in player.get_spells():
		if get_spell_convert_from_id(spell) != "":
			convertible_spells.append(spell)

	if convertible_spells.size() > 1:
		main.spell_banner.slide_in(self)

		player.set_active_spell(self)
		var convert_spell: Spell = await player.get_selection(player.Selection.SPELL, func(spell: Spell): return spell in convertible_spells)
		player.set_active_spell(null)

		main.spell_banner.slide_out()

		if convert_spell == null or convert_spell not in convertible_spells:
			return null
		else:
			return convert_spell
	else:
		return convertible_spells[0]


func spell_select(spell_select_spell: SpellSelectSpell) -> bool:
	var upgrading_spell: = await get_upgrading_spell()
	if upgrading_spell == null:
		spell_select_spell.cancel_selection()
	else:
		if AchievementManager.should_track_stats():
			SaveManager.get_save().track_spell_used(id, Game.difficulty)

		upgrade_spell(upgrading_spell)
		spell_select_spell.complete_selection()

	return true


func track_found() -> void :
	super.track_found()
	if AchievementManager.should_track_stats():
		track_red_letter_upgrades_found()

func get_description() -> String:
	if Game.is_in_run() and Game.player.id in CharacterLoader.added_characters:
		return get_string_group().get_string(Game.player.id, get_tooltip_context())
	else:
		return super()
