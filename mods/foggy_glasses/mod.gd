extends Mod

func _ready() -> void:
    load("res://mods/spell_framework/mod.gd").add_spell("foggy_glasses",10000.0,"support")
