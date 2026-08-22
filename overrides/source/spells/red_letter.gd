class_name RedLetterSpell
extends Spell

const SPELL_UPGRADES = {
	SPELLS.LETTER_OPENER: SPELLS.SILVER_LETTER_OPENER, 
	SPELLS.HOLE_PUNCH: SPELLS.SCALPEL, 
	SPELLS.FISHING_ROD: SPELLS.REINFORCED_FISHING_ROD, 
	SPELLS.SALT: SPELLS.SALT_AND_PEPPER, 
	SPELLS.GIFT_ENHANCING: SPELLS.MIRACLE_CACHE_ENHANCING, 
	SPELLS.GIFT_DEFENSE: SPELLS.MIRACLE_CACHE_DEFENSE, 
	SPELLS.GIFT_PUZZLE: SPELLS.MIRACLE_CACHE_PUZZLE, 
}

static var custom_spell_upgrades: = SPELL_UPGRADES.duplicate()

var replacing_clown_gift
var is_gaining = false



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
	if spell.id in custom_spell_upgrades:
		return spell.id
	elif spell.secret_id in custom_spell_upgrades:
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
			save.track_spell_found(custom_spell_upgrades[other_convert_from_id], Game.difficulty)


func upgrade_spell(spell: Spell) -> void :
	var convert_from_id: = get_spell_convert_from_id(spell)
	if convert_from_id == "":
		return

	if AchievementManager.should_track_stats():
		track_red_letter_upgrades_found()
		SaveManager.get_save().track_spell_taken(custom_spell_upgrades[convert_from_id], Game.difficulty)

	spell.transform_spell(custom_spell_upgrades[convert_from_id], not convert_from_id in Globals.GIFTS)


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
