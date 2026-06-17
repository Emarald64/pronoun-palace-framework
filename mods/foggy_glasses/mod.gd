extends Mod

func _ready() -> void:
    load("res://mods/framework/mod.gd").add_spell("foggy_glasses",10000.0,"support")
    var enemy_loader=load("res://mods/framework/enemy_loader.gd")
    enemy_loader.enemy_pools[0][0].clear()
    enemy_loader.add_enemy("paparazzi",0,0)
    print(enemy_loader.enemy_pools)
