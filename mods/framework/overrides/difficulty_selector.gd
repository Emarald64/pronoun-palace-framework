extends DifficultySelector

var character_loader=load("res://mods/framework/character_loader.gd")

var current_character:String=Globals.CHARACTERS.LEXICOGRAPHER

func set_character(character: String):
	var target_difficulty
	if character in character_loader.added_characters:
		target_difficulty=character_loader.save_data.selected_character_difficulty.get(character,10)
	else:
		target_difficulty = SaveManager.get_save_data().selected_character_difficulty[character]
		if not Globals.is_difficulty_unlocked(target_difficulty, character):
			target_difficulty = 0
	
	current_character=character
	select_difficulty(target_difficulty)

	for icon in icon_selector.icons:
		icon.character = character

	icon_selector.set_initial_selection(selected_difficulty)

func select_difficulty(difficulty: int):
	selected_difficulty = difficulty
	update_labels()
	if current_character in character_loader.added_characters:
		character_loader.save_data.selected_character_difficulty[current_character]=difficulty
		get_node("../CharacterSelector")._on_difficulty_updated()
	else:
		selected.emit()
