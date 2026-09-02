@abstract
class_name GiftTemplate
extends "res://source/spells/gift.gd"

func _get_reroll_catagory()->String:
	return ""

func _get_reroll_pool()->Dictionary[String,float]:
	return SpellData.get_spell_pool(_get_reroll_catagory())

func get_gift_reroll_pool(exclude_spells = [], allow_player_repeats: = false) -> Dictionary:
	var pool = _get_reroll_pool()
	
	if not allow_player_repeats:
		for spell in player.get_spells():
			pool.erase(spell.id)
	
	for spell_id in exclude_spells:
		pool.erase(spell_id)

	return pool

func do_battle_start_transformation(exclude_spells):
	reroll()
