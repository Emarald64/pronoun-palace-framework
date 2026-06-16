class_name SpellFramework extends Mod

const pronoun_palace_version="1.0.21"

static var spell_pool:Dictionary
static var spell_categories:Dictionary=Globals.SPELL_CATEGORIES.duplicate(true)

## Adds a spell to the list of spells that can appear randomly
## A higher weight makes the spell appear more often
## The catagory is used to determine whether it it will appear in the jubalist's boxes 
static func add_spell(id:String,weight:float=1.0,catagory:String="")->void:
    spell_pool[id]=weight
    if catagory!="":
        spell_categories[catagory].append(id)
    print("added spell "+id)
    
static func add_vanillia_spells()->void:
    if spell_pool==null:
        spell_pool={}
    spell_pool.merge(Globals.SPELL_POOL)

#static func _static_init() -> void:
    #Globals.set_script(load("res://mods/spell_framework/custom_globals.gd"))

func _ready() -> void:
    add_vanillia_spells()
    #spell_pool=Globals.SPELL_POOL.duplicate()
    print("spell_catagories: "+str(spell_categories))
    print("loaded spell framework")
    #print("has globals: "+str(ProjectSettings.has_setting("autoload/Globals")))
    print("globals path: "+str(ProjectSettings.get_setting("autoload/Globals")))
    if pronoun_palace_version!=ProjectSettings.get_setting("application/config/version"):
        push_warning("The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+") may be incompatible with this version of the framework for "+pronoun_palace_version+" proceed at you own risk")
        var popup=load("res://mods/spell_framework/incompatible_version_popup.tscn").instantiate()
        popup.get_node("Label").text="The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+")\nmay be incompatible with this version of the framework for "+pronoun_palace_version+"\nproceed at you own risk"
        add_child(popup)
        
    await get_tree().process_frame
    Globals.set_script(load("res://mods/spell_framework/custom_globals.gd"))
