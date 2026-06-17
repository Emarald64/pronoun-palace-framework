extends Object

static var enemy_pools:=Enemies.POOLS.duplicate_deep()
static var shadows:=Enemies.SHADOWS.duplicate()

## Add a regular enemy. Shadows enemies should use add_shadow instead 
static func add_enemy(id:String,act:int,position_in_act:int):
    enemy_pools[act][position_in_act].append(id)
    print("added enemy "+id)

## Add a shadow af an enemy. An enemy cannot have multiple shadows, adding a second will override the first
static func add_shadow(id:String,shadowing:String):
    shadows[shadowing]=id
    print("added shadow enemy "+id)
