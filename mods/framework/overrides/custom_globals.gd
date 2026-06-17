extends "res://source/autoload/globals.gd"

#func is_spell_unlocked(spell):
 #if spell in STEAM_ONLY_SPELLS and not Bridge.has_steam():
  #return false
#
 #if spell not in SPELL_ACHIEVEMENTS:
  #return true
#
 #return AchievementManager.has_achievement(spell)


func _ready() -> void:
    print("using custom globals")
    print("spell pool"+str(load("res://mods/framework/mod.gd").spell_pool))
    #SpellData._static_init()

func get_spell_pool(category = null):
 print("loading custom spell pool")
 var spell_framework=load("res://mods/framework/mod.gd")
 var weighted_spells = spell_framework.spell_pool
 var spell_pool = {}

 if category != null:
  weighted_spells = SPELL_CATEGORIES[category]

 for spell in weighted_spells:
  if is_spell_unlocked(spell):
   spell_pool[spell] = spell_framework.spell_pool[spell]
 print("spell pool "+str(spell_pool))
 return spell_pool
