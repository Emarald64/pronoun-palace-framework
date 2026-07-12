extends "res://source/autoload/globals.gd"

#func is_spell_unlocked(spell):
 #if spell in STEAM_ONLY_SPELLS and not Bridge.has_steam():
  #return false
#
 #if spell not in SPELL_ACHIEVEMENTS:
  #return true
#
 #return AchievementManager.has_achievement(spell)

#var character_loader=load("res://mods/framework/character_loader.gd")

func _ready() -> void:
	print("using custom globals")
	#SpellData._static_init()

func get_spell_pool(category = null):
	print("loading custom spell pool")
	#var spell_loader=load("res://mods/framework/spell_loader.gd")
	var weighted_spells = SpellLoader.spell_pool
	var spell_pool = {}

	if category != null:
		weighted_spells = SPELL_CATEGORIES[category]

	for spell in weighted_spells:
		if is_spell_unlocked(spell):
			spell_pool[spell] = SpellLoader.spell_pool[spell]
	print("spell pool "+str(spell_pool))
	return spell_pool

func is_difficulty_unlocked(difficulty: int, character: String = "") -> bool:
	if character in CharacterLoader.added_characters:
		return true
	if character == "":
		return AchievementManager.has_achievement(Globals.ACHIEVEMENTS.OVERALL_MAX_DIFFICULTY, difficulty)
	else:
		if not Globals.is_character_unlocked(character):
			return false

		var character_difficulty = Globals.CHARACTER_DIFFICULTY_ACHIEVEMENTS[character]
		return AchievementManager.has_achievement(character_difficulty, difficulty)

func is_character_trans(id, difficulty):
	if difficulty == 10:
		return id in CharacterLoader.added_characters or AchievementManager.has_achievement(CHARACTER_DIFFICULTY_ACHIEVEMENTS[id], 11)
	else:
		return difficulty > 0
