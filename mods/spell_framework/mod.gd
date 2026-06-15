class_name SpellFramework extends Mod

const pronoun_palace_version="1.0.21"

## Adds a spell to the list of spells that can appear randomly
## A higher weight makes the spell appear more often
## The catagory is used to determine whether it it will appear in the jubalist's boxes 
static func add_spell(id:String,weight:float=1.0,catagory:String="")->void:
    Globals.SPELL_POOL[id]=weight
    if catagory!="":
        Globals.SPELL_CATEGORIES[catagory].append(id)

func _ready() -> void:
    if pronoun_palace_version!=ProjectSettings.get_setting("application/config/version"):
        push_warning("The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+") may be incompatible with this version of the framework for "+pronoun_palace_version+" proceed at you own risk")
        var popup=load("res://mods/spell_framework/incompatible_version_popup.tscn").instantiate()
        popup.get_node("Label").text="The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+")\nmay be incompatible with this version of the framework for "+pronoun_palace_version+"\nproceed at you own risk"
        add_child(popup)
    
