extends "res://source/enemies/nobody.gd"

var character_loader=load("res://mods/framework/character_loader.gd")

func _ready():
    super._ready()
    next_move = "expand_board"
    
func _get_health_scaling():
    return Enemies.NOBODY_HEALTH_SCALING[Globals.CHARACTERS.LEXICOGRAPHER]
