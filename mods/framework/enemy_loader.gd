class_name EnemyLoader extends Object

## Replacement enemy poolsm used instead of the vanilla ones
static var enemy_pools:=Enemies.POOLS.duplicate_deep()
static var shadows:=Enemies.SHADOWS.duplicate()
static var custom_phonebook_icons:Dictionary[String,String]={}

## Add a regular enemy. Shadows enemies should use add_shadow instead 
static func add_enemy(id:String,act:int,position_in_act:int,phonebook_icon_path:=""):
	enemy_pools[act][position_in_act].append(id)
	if not phonebook_icon_path.is_empty():
		custom_phonebook_icons[id]=phonebook_icon_path
	print("added enemy "+id)

## Add a shadow af an enemy. An enemy cannot have multiple shadows, adding a second will override the first
static func add_shadow(id:String,shadowing:String,phonebook_icon_path:=""):
	shadows[shadowing]=id
	if not phonebook_icon_path.is_empty():
		custom_phonebook_icons[id]=phonebook_icon_path
	print("added shadow enemy "+id)
