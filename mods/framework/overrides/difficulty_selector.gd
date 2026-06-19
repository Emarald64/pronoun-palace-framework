extends DifficultySelector

var character_loader=load("res://mods/framework/character_loader.gd")

func set_character(character: String):
 var target_difficulty
 if character in character_loader.added_characters:
    target_difficulty = 10
 else:
    target_difficulty = SaveManager.get_save_data().selected_character_difficulty[character]
    if not Globals.is_difficulty_unlocked(target_difficulty, character):
        target_difficulty = 0

 select_difficulty(target_difficulty)

 for icon in icon_selector.icons:
  icon.character = character

 icon_selector.set_initial_selection(selected_difficulty)
