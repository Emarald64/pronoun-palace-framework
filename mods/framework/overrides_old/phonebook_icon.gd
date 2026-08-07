#class_name PhonebookIcon
extends PhonebookIcon

#var enemy_loader=load("res://mods/framework/enemy_loader.gd")

func set_entry(entry: PhonebookEntry) -> void :
	super(entry)
	if entry.id in EnemyLoader.custom_phonebook_icons:
		sprite.hframes=1
		sprite.vframes=1
		sprite.texture=load(EnemyLoader.custom_phonebook_icons[entry.id])
