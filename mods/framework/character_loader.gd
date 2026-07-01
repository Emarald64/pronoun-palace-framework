class_name CharacterLoader extends Object

## List of added characters
static var added_characters:Array[String]=[]
## Dictionary of character id to icon [Texture2D] 
static var added_character_icons:Dictionary[String,Texture2D]={}
## Character id to spell id
static var character_spells:Dictionary[String,String]={}
## Character id to path to nobody scene
static var nobody_scenes:Dictionary[String,String]={}

const default_save_data={
	selected_character_difficulty={}
	}

static var save_data=default_save_data.duplicate_deep()

## Add a custom character. 
## Character spells should be marked as character specific by putting a character id in their tags, It doesn't mattch what character is put in the tags, using a vanilla character is recomended.
static func add_character(id:String,character_spell:String=Globals.SPELLS.LETTER_OPENER,character_icon:Texture2D=null,nobody_scene_path="res://mods/framework/overrides/custom_nobody.tscn"):
	added_characters.append(id)
	character_spells[id]=character_spell
	if character_icon!=null:
		added_character_icons[id]=character_icon
	nobody_scenes[id]=nobody_scene_path
	print("added charater: "+id)
	
