#@warning_ignore("shadowed_global_identifier")
#class_name SpellData 
extends "res://source/spell/spell_data.gd"

func _init(_id: String) -> void :
	super(_id)

	var group: = StringManager.get_string_group("spell/" + id)
	
	if group.has_string("flags"):
		var flags: = group.get_string("flags").split(" ", false)
		for flag in flags:
			if flag in CharacterLoader.added_characters:
				push_warning("Using custom character ids as spell flags may be removed in a future version. Use one of the vanilla characters as flags instead")
				character = flag
				character_specific = true
				fixed_max_charge = true
