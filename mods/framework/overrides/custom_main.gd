extends Main


var enemy_loader=load("res://mods/framework/enemy_loader.gd")
var character_loader=load("res://mods/framework/character_loader.gd")

func _init():
 print("custom main init")
 super._init()

func _ready():
    print("custom main ready")
    super._ready()


func generate_act():
 act_events = []

 for stage_pool in enemy_loader.enemy_pools[act]:
  var use_pool = stage_pool.duplicate()
  print("generate act: "+str(use_pool))

  if Game.debug_spawn_enemy != "":
   if Enemies.enemy_in_pool(Game.debug_spawn_enemy, stage_pool):
    act_events.append({enemy = Game.debug_spawn_enemy, debug = true})
    continue

  if Game.active_daily:
   Game.active_daily.modify_enemy_pool(use_pool)
  else:
   var encountered_enemies: Array[String] = []
   var unencountered_enemies: Array[String] = []
   for id in use_pool:
    var stats = SaveManager.get_save().get_enemy_stats(id, -1, false)
    if stats.encounters == 0:
     unencountered_enemies.append(id)
    else:
     encountered_enemies.append(id)

   var priority_pool: Array[String] = []
   for id in Enemies.PRIORITY_ENCOUNTERS:
    if id in use_pool and id in unencountered_enemies:
     priority_pool.append(id)

   if not priority_pool.is_empty():
    use_pool = priority_pool
   elif encountered_enemies.size() == 0:
    for id in Enemies.DEPRIORITY_ENCOUNTERS:
     if id in use_pool:
      use_pool.erase(id)

  var enemy_name = rng.enemy.pick_random(use_pool)
  act_events.append({enemy = enemy_name})

 var num_spell_selections = 2

 var spell_select_locations = [1, 2, 3]
 if num_spell_selections == 1:
  spell_select_locations = [1, 2]

 if not SaveManager.get_save_data().seen_first_spell_select and not Game.active_daily:
  spell_select_locations = [2, 3]

 rng.game.shuffle(spell_select_locations)
 spell_select_locations = spell_select_locations.slice(0, num_spell_selections)

 spell_select_locations.sort_custom( func(a, b): return a > b)

 var spell_select_index: = spell_select_locations.size() - 1
 for index in spell_select_locations:
  act_events.insert(index, {spell_select = true, spell_select_index = spell_select_index})
  spell_select_index -= 1

 if Game.debug_spawn_enemy != "":
  var enemy_index: = 0
  for i in act_events.size():
   if act_events[i].get("enemy", "") == Game.debug_spawn_enemy:
    enemy_index = i
    break

  Game.debug_spawn_enemy = ""
  act_events = act_events.slice(enemy_index)


func spawn_player(id):
 Game.player = load("res://source/characters/" + id + ".tscn").instantiate()
 player = Game.player

 player.action_finished.connect(_on_player_action_finished)
 player.rerolled.connect(_on_player_rerolled)

 player_marker.add_child(player)

 player_info_bar.set_battle_unit(player)
 player.set_intent_container( %PlayerIntentContainer)

 if id == Globals.CHARACTERS.ADDICT:
  turn_timer.enable()


func spawn_enemy(enemy_name):
 if enemy_name==Enemies.NOBODY and player.id in character_loader.nobody_scenes:
    enemy_name = character_loader.nobody_scenes[player.id]
 if enemy_name.get_extension() != "tscn":
  enemy_name = "res://source/enemies/" + enemy_name + ".tscn"

 var enemy_scene = load(enemy_name)
 enemy = enemy_scene.instantiate()

 Game.enemy = enemy
 last_enemy_id = enemy.id

 enemy.action_finished.connect(_on_enemy_action_finished)
 enemy_marker.add_child(enemy)
 enemy_info_bar.set_battle_unit(enemy)
 enemy.set_intent_container( %EnemyIntentContainer)
