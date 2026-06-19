extends Object

static var added_characters:Array[String]=[]
static var added_character_icons:Dictionary[String,Texture2D]={}
static var character_spells:Dictionary[String,String]={}

static func add_character(id:String,character_spell:String=Globals.SPELLS.LETTER_OPENER,character_icon:Texture2D=null):
    added_characters.append(id)
    character_spells[id]=character_spell
    if character_icon!=null:
        added_character_icons[id]=character_icon
    print("added charater: "+id)
    
