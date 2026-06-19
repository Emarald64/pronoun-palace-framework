extends "res://source/autoload/game.gd"

const custom_main_path="res://mods/framework/overrides/main.tscn"

#func _init():
    #print("init custom game")
    #print("path:"+str(get_path()))
    #print("script:"+str(get_script()))

func start_run(run_character, run_seed = null, debug: = false):
 DailyManager.set_process(false)
 AudioManager.fade_music()
 AudioManager.fade_sounds()
 debug_run = debug
 new_run_character = run_character
 new_run_seed = run_seed
 active_daily = null
 is_seeded = run_seed != null
 loading_run_save = null
 get_tree().change_scene_to_file(custom_main_path)


func start_daily_run(debug: = false) -> void :
 DailyManager.set_process(false)
 AudioManager.fade_music()
 AudioManager.fade_sounds()
 debug_run = debug
 active_daily = DailyManager.current_daily
 difficulty = active_daily.difficulty
 new_run_character = active_daily.character
 new_run_seed = active_daily.game_seed
 is_seeded = true
 loading_run_save = null
 get_tree().change_scene_to_file(custom_main_path)


func load_run(run_save):
 DailyManager.set_process(false)
 AudioManager.fade_music()
 AudioManager.fade_sounds()
 loading_run_save = run_save
 get_tree().change_scene_to_file(custom_main_path)
