extends Mod

func _ready() -> void:
    load("res://mods/framework/mod.gd").add_spell("foggy_glasses",1.0,"support")
    var enemy_loader=load("res://mods/framework/enemy_loader.gd")
    #enemy_loader.enemy_pools[0][0].clear()
    enemy_loader.add_enemy("paparazzi",0,0)
    print(enemy_loader.enemy_pools)
    
    var character_loader=load("res://mods/framework/character_loader.gd")
    character_loader.add_character("dew_jubilist",Globals.SPELLS.VERIFICATION_CAN,load("res://mods/foggy_glasses/dew_jubilist_icons.png"))
