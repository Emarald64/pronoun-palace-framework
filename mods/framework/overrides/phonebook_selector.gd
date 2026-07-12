extends PhonebookSelector

var row_limit=3

var custom_phonebook_icon_scene=load("res://mods/framework/overrides/custom_phonebook_icon.tscn")
#var enemy_loader=load("res://mods/framework/enemy_loader.gd")

func _ready() -> void :
	phonebook_label.text = StringManager.get_string("menu/main/phonebook")
	await get_tree().process_frame
	for act in EnemyLoader.enemy_pools.size():
		var label = Label.new()
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.text = StringManager.get_string("misc/act_" + str(act) + "/subtitle")
		label.theme_type_variation = &"MainMenuLabel"
		label.add_theme_font_size_override("font_size", 10)
		vertical_container.add_child(label)
		var act_pool = EnemyLoader.enemy_pools[act]
		for enemy_set in act_pool:
			for enemy in enemy_set:
				if StringManager.has_string("enemy/" + enemy + "/phonebook"):
					add_icon(enemy)
			if enemy_set!=act_pool[-1]:
				add_hbox()

func add_icon(id) -> PhonebookIcon:
	var add_to_box: HBoxContainer
	if vertical_container.get_child_count() != 0:
		var last_child = vertical_container.get_child(-1)
		if last_child is HBoxContainer:
			add_to_box = vertical_container.get_child(-1)

	if add_to_box == null or add_to_box.get_child_count() >= row_limit:
		add_to_box = add_hbox()

	var entries: Array[PhonebookEntry] = [PhonebookEntry.new(id)]
	if id in EnemyLoader.shadows:
		entries.append(PhonebookEntry.new(EnemyLoader.shadows[id]))

	var icon: PhonebookIcon
	if id in EnemyLoader.custom_phonebook_icons:
		icon=custom_phonebook_icon_scene.instantiate()
	else:
		icon = phonebook_icon_scene.instantiate()
	add_to_box.add_child(icon)
	icon.set_entries(entries)
	icon.selected.connect(_on_card_selected)
	icons.append(icon)
	return icon
