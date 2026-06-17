extends "res://source/ui/menu/phonebook/phonebook_selector.gd"

func _ready() -> void :
 phonebook_label.text = StringManager.get_string("menu/main/phonebook")
 var enemy_loader=load("res://mods/framework/enemy_loader.gd")
 print("loading phonebook entries")
 await get_tree().process_frame
 for act in enemy_loader.enemy_pools.size():
  var label = Label.new()
  label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
  label.text = StringManager.get_string("misc/act_" + str(act) + "/subtitle")
  label.theme_type_variation = &"MainMenuLabel"
  label.add_theme_font_size_override("font_size", 10)
  vertical_container.add_child(label)
  var act_pool = enemy_loader.enemy_pools[act]
  for enemy_set in act_pool:
   for enemy in enemy_set:
    if StringManager.has_string("enemy/" + enemy + "/phonebook"):
     print("adding "+enemy+" to phonebook")
     add_icon(enemy)
