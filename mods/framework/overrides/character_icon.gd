extends CharacterIcon

var character_loader=load("res://mods/framework/character_loader.gd")

func set_character(id: String, trans: bool = false) -> void :
 if id not in Globals.CHARACTER_ICONS:
    if id in character_loader.added_character_icons:
        texture=character_loader.added_character_icons[id]
        hframes=1
    else:
        frame=0
 else:
     frame = Globals.CHARACTER_ICONS[id]
 if trans:
  if id in character_loader.added_character_icons:
    frame=1
  else:
   frame += 5

 if not show_locked_character and not Globals.is_character_unlocked(id):
  modulate = Color.BLACK
 else:
  modulate = Color.WHITE
