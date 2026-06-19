extends Object

static var added_characters:Array[String]=[]
static var added_character_icons:Dictionary[String,Texture2D]={}
static var character_spells:Dictionary[String,String]={}
#static var nobody_health_scaling:Dictionary[String,Array]={}
static var nobody_scenes:Dictionary[String,String]={}

## Nobody health scaling does nothing if nobody scene is set
static func add_character(id:String,character_spell:String=Globals.SPELLS.LETTER_OPENER,character_icon:Texture2D=null,nobody_scene_path="res://mods/framework/overrides/custom_nobody.tscn"):
    added_characters.append(id)
    character_spells[id]=character_spell
    if character_icon!=null:
        added_character_icons[id]=character_icon
    #nobody_health_scaling[id]=character_nobody_health_scaling
    nobody_scenes[id]=nobody_scene_path
    print("added charater: "+id)
    
