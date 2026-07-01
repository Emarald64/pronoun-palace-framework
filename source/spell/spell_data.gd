#class_name SpellData 
extends RefCounted


const CHARGE_CATEGORIES = Globals.CHARGE_CATEGORIES
const CURSES = Globals.SPELL_CURSES

static var random_charge_spells: Array[String] = []

#static var character_loader=load("res://mods/framework/character_loader.gd")

var id: String = ""

var charge_category: String = CHARGE_CATEGORIES.COMMON
var specific_characters: = PackedStringArray()
var exclude_characters: = PackedStringArray()
var base_max_charge: int = 0
var character: String = ""
var character_specific: = false
var discharge_on_load: = false
var fixed_max_charge: = false
var removes_word: = false
var use_while_selecting: = false
var no_use_sound: = false
var immediate_effect: = false

static func _static_init() -> void:
	random_charge_spells.clear()
	var spell_pool=Globals.SPELL_POOL
	for spell in spell_pool:
		var group: = StringManager.get_string_group("spell/" + spell)
		if group.has_string("charge_characters"):
			random_charge_spells.append(spell)
		else:
			var category: = group.get_string("charge_category")
			if category not in Globals.SPECIAL_CHARGES:
				random_charge_spells.append(spell)
 


func _init(_id: String) -> void :
	id = _id

	var group: = StringManager.get_string_group("spell/" + id)

	if group.has_string("charge_characters"):
		charge_category = CHARGE_CATEGORIES.SPECIFY
		specific_characters = group.get_string("charge_characters").split()
	else:
		charge_category = group.get_string("charge_category")

	if group.has_string("exclude_characters"):
		exclude_characters = group.get_string("exclude_characters").split()

	if has_charge() and charge_category != CHARGE_CATEGORIES.RANDOM_SPELL:
		base_max_charge = group.get_string("max_charge").to_int()

	if group.has_string("flags"):
		var flags: = group.get_string("flags").split(" ", false)
		for flag in flags:
			if flag in Globals.CHARACTERS.values():
				character = flag
				character_specific = true
				fixed_max_charge = true
			elif flag == "discharge_on_load":
				discharge_on_load = true
			elif flag == "fixed_max_charge":
				fixed_max_charge = true
			elif flag == "removes_word":
				removes_word = true
			elif flag == "use_while_selecting":
				use_while_selecting = true
			elif flag == "no_use_sound":
				no_use_sound = true
			elif flag == "immediate":
				immediate_effect = true
			elif flag not in CharacterLoader.added_characters:
				assert (false, "Invalid spell flag " + flag + " for spell " + id)


func has_charge() -> bool:
	return charge_category != CHARGE_CATEGORIES.UNLIMITED


func has_charge_character() -> bool:
	return charge_category not in [CHARGE_CATEGORIES.UNLIMITED, CHARGE_CATEGORIES.LIMITED, CHARGE_CATEGORIES.AUTO]


func get_charge_pool() -> Array[String]:
	var pool: Array[String] = []
	if charge_category in Globals.CHARGE_CHARACTERS:
		pool.append_array(Globals.CHARGE_CHARACTERS[charge_category])
	elif charge_category == CHARGE_CATEGORIES.SPECIFY:
		pool.append_array(specific_characters)

	if exclude_characters.size() != 0:
		return pool.filter( func(letter): return letter not in exclude_characters)
	else:
		return pool


func can_reroll_charge():
	if not has_charge_character():
		return false

	if get_charge_pool().size() <= 1:
		return false

	return true


func can_have_curse(curse):
	if id == Globals.SPELLS.RED_LETTER or id == Globals.SPELLS.RED_TAPE:
		return false

	var is_gift = id in Globals.GIFT_SPELLS

	if not is_gift:
		if curse in [CURSES.FRAGILE, CURSES.LACED] and not has_charge():
			return false

		elif curse == CURSES.FRAGILE and charge_category in [CHARGE_CATEGORIES.LIMITED, CHARGE_CATEGORIES.AUTO]:
			return false

		elif curse == CURSES.ESOTERIC and not can_reroll_charge():
			return false

	if curse == CURSES.SHINY and Game.player.get_num_spells() <= 1:
		return false

	return true
