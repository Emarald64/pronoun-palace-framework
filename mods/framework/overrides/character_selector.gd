extends CharacterSelector

var character_loader=load("res://mods/framework/character_loader.gd")
var icon_scene=load("res://mods/framework/overrides/character_selector_icon.tscn")

func update_character() -> void :
	var id = selected_character
	var character_difficulty = get_character_difficulty(id)
	var is_trans = Globals.is_character_trans(id, character_difficulty)

	prep_character_sprite(id, is_trans)

	var context = {trans = is_trans}
	if selected_is_unlocked:
		%TitleLabel.text = StringManager.get_string("menu/character_select/title", {
			title = StringManager.get_string("character/%s/title" % id, context)
		})
		%DescriptionLabel.text = StringManager.get_string("character/%s/description" % id, context)
		%SpellSprite.modulate = Color.WHITE
		%InfoSprite.modulate = Color.WHITE
	else:
		%TitleLabel.text = StringManager.get_string("menu/character_select/locked")
		%DescriptionLabel.text = StringManager.get_string("achievements/unlock_%s/unlock" % id, {locked = true})
		%SpellSprite.modulate = Color.BLACK
		%InfoSprite.modulate = Color.BLACK

	%NameLabel.text = char_string_or_locked("name", context)
	%SexLabel.text = char_string_or_locked("sex", context)
	%HeightLabel.text = char_string_or_locked("height", context)
	%WeightLabel.text = char_string_or_locked("weight", context)
	%OccupationLabel.text = char_string_or_locked("occupation", context)

	var spell_id:String
	if id in character_loader.character_spells:
		spell_id=character_loader.character_spells[id]
	else:
		spell_id = Globals.CHARACTER_SPELLS[id][0]
	var spell: = Spell._instantiate_spell(spell_id)
	if character_difficulty == 10:
		spell.set_curse(Globals.SPELL_CURSES.CURSED)

	%SpellSprite.link_spell(spell)
	%SpellName.text = string_or_locked("spell/" + spell_id + "/name", {curse = "cursed" if character_difficulty == 10 else ""})
	%SpellDescription.text = char_string_or_locked("spell_description")

	%InfoTitle.text = char_string_or_locked("info_title")
	%InfoLabel.text = char_string_or_locked("info")



func instantiate_icons() -> void :
	for id in CHAR_ORDER+character_loader.added_characters:
		var icon: CharacterSelectorIcon = icon_scene.instantiate()
		icon.set_character(id, Globals.is_character_trans(id, get_character_difficulty(id)))
		icons.append(icon)

	var selector_icons: Array[SelectorIcon] = []
	selector_icons.assign(icons)
	icon_selector.set_icons(selector_icons)
	icons_instantiated = true

func get_character_difficulty(character: String) -> int:
	if character in character_loader.added_characters:
		return character_loader.save_data.selected_character_difficulty.get(character,10)
	else:
		return SaveManager.get_save().data.selected_character_difficulty[character]

func _on_start_appearing() -> void :
	if not icons_instantiated:
		instantiate_icons()

	update_character_icons()

	selected_character = SaveManager.get_save_data().selected_character
	if (selected_character not in CHARACTERS.values() and selected_character not in character_loader.added_characters) or not Globals.is_character_unlocked(selected_character):
		selected_character = CHARACTERS.LEXICOGRAPHER

	icon_selector.set_initial_selection(CHAR_ORDER.find(selected_character))
	select_character(selected_character)
	await get_tree().process_frame
	if selected_character in character_loader.added_characters:
		icon_selector.get_child(1).ensure_control_visible(icon_selector.icons[5+character_loader.added_characters.find(selected_character)])
