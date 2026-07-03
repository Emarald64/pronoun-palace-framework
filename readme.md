# Pronoun Palace Framework

The Foggy Glasses are included in this repo as an example of a mod which uses the framework.   
It adds the spell foggy glasses, the enemy Aqua, and the character Dew Jubilist  
The foggy glasses are based off the Dyslexic character by [Soƒti](https://bsky.app/profile/softisafe.bsky.social)

Pronoun Palace and this framework are written in Godot, using GDScript. You should know how to use Godot if you want to make mods for this game. You can learn Godot from the offical docs [here](https://docs.godotengine.org/en/stable/getting_started/introduction/index.html) and there are tons of tutorials for it on youtube (though, personally I find video tutorials unhelpful to learn things). 

If you need help learning how to mod Pronoun Palace, check out the guide I made: [How to make Pronoun Palace mods](https://gist.github.com/Emarald64/65943d629b6ff5fd08a2d8022397aacb) or ask me in the \#modding channel in the Pronoun Palace Discord. 

The .pck files for the framework and foggy glasses mods are not included when cloning the repo. In the editor, the mod_loader will not run the scripts for these mods without a .pck file in `res://mod_packs/framework` or `res://mod_packs/foggy_glasses` respectively. Either download them from the realeases page or package them yourself by running the `mod_packer.gd` script in the `mods/framework` and `mods/foggy_glasses` folders

> [!NOTE]
> The framework requires a specific version of Pronoun Palace to work. The version will be shown on the release page and you will see a popup when starting the game on an unsupported version

## How to make you own spell

1. Make up an spell id for you spell. They are usually in snake case (foggy_glasses). Any instances of `spell_id` should be replaced with whatever id you chose
2. Make the strings file for your spell `res://strings/spell/spell_id.txt`
> [!IMPORTANT]
> The strings files use tabs for indentation howerver the Godot built in text editor uses spaces and will automatilly replace tabs with spaces when editing a file. Make sure to press Edit>indentation>convert indentation to tabs or use an external text editor for editing strings files

The strings file for you spell should follow this template
```
:name:
	Spell Name

:description:
	Longer description shown when hovering over the spell 

:label:
	Simple discription of effects. Often 3 words or less

:charge_characters:
	o
or
:charge_catagory:
	one of: common, uncommon, rare, unlimited (no charge requirement), limited (one time use?), auto (recharges after every word)

:max_charge:
	2

optional:
:flags:
	removes_word discharge_on_load (id of the character its a character spell for)
```

3. Create the spell script in `res://source/spells/spell_id.gd` it should inherit Spell if you don't select a tile to affect or TileModifierSpell if it does. Look at the spells already in the game or the foggy glasses for examples of spell scripts
4. Create a mod to load your spell into the spell framework. You can copy the foggy_glasses mod replacing the "foggy_glasses" spell id in the mod.gd with your own
5. optional: Put the spell's sprite in `res://arte/spells/spell_id.png` 

## How to add an enemy

1. Make up an id for your enemy. They are usually in snake case (foggy_glasses). Any instances of `enemy_id` should be replaced with whatever id you chose
2. Make a strings file for your enenmy `res://strings/enemies/enemy_id.txt` with the following format:
```
:name:
	Enemy Name

:phonebook:
	Enemy phonebook entry
```

3. Create a scene and script for your enemy in `res://source/enemies` named enemy_id.tscn and enemy_id.gd.
The enemy script should extend Enemy. Look at the vanilla enemies and the paparazzi scripts for examples. Additionally, diffrently from vanilla enemies, you need to define _get_health_scaling() which returns an array of length 4 for health values at diffrent dificulties.
4. Create the scene for your enemy sprite `res://source/enemies/sprites/enemy_id_sprite.tscn`. It should be an inherited scene of `res://source/battle_unit_sprite.tscn` 
The AnimPlayer must have a flinch animation and should preferably have a dying and die animation as well as any animations for attacks
5. In your mod script call `load("res://mods/framework/enemy_loader.gd").add_enemy("enemy_id",act,floor)` replacing act and floor with the act and postition in the act that your enemy will appear in respecively.

Although it is no longer included in the mod, the repo still contains an example enemy named paparazzi for refrence

## How to add your own character

1. Make an id for your character. It should be snake_case. Replace any char_id in the guide with this id.
2. Make the strings file for your character `res://strings/character/char_id.txt`. it should look like this:

```
:title:
	Strawman

:name:
	{"Straw Woman" if trans}{"Straw Man" not trans}

:description:
	A wouge stwawman made by the pawty
	May expwode unpwedictabwy

:spell_description:
	Make all the tiles on the board bombs.

:info_title:
	Info

:info:
	An explosive chalange

:sex:
	{"F" if trans}{"M" not trans}

:pronouns:
	she/her

:height:
	5-10

:weight:
	{"144" if trans}{"142" not trans}

:occupation:
	STRAWMAN
```

3. Create the sripte for your character. You can base it off of one the vanilla character sprites. It should be at `res://source/source/characters/sprites/char_id.tscn` 
4. Create the character script at `res://source/characters/char_id.gd`. It should look like this:  
```
func _init():
 id = "char_id"
 starting_spells = ["starting_spell_id"]


func get_gender():
 if is_trans():
  return Gender.FEMALE
 else:
  return Gender.MALE
```   
(The get_gender function isn't used but may be in a future update)

5.  Create the character scene at `res://source/characters/char_id.tscn`. It should have a Node2D with the character script attached and the character sprite named `Sprite` as a child
6. In your mod script call load("res://mods/framework/character_loader.gd").add_character("char_id","starting_spell_id").  
Note that character spells do not need to be registered seperatly with the framework and should have the tag of their character's id in the spell's strings file
7. (optional) Make icons for your character. They should be 34x34 each and be in a spritesheet stacked verticlly with the trans version on the bottom. Load it and put it as the third argumant for the add_character function

### Nobody Fight. 

By default custom characters will use the lexicographer's nobody fight  
If you want a custom one follow the guide the create an enemy. you will most likely want to inherit nobody's scene `res://source/enemies/nobody.tscn` and extend it's script `res://source/enemies/nobody.gd`

Put the path the the custom nobody scene as the fourth argument to the add character function

## Creating a custom mod options menu

> This guide will assume that you are using the framework's mod menu template

1 Create functions that will be called to get and set the options in the menu.\
	For the setter, The first argument is the name of the option and the second is the new value of the option.\
	For the getter, the only argument is the name of the option and it should return the current value of the option

2 Create a function which create the mod menu
	a Load and instantiate the mod options template `res://mods/framework/mod_options.tscn`
	b Set the options property of the template to an array of dictionaries. The dictionaries should have the following format\
	```
	{
		name="Name of option"
		type=Variant.Type.TYPE_BOOL # the type of the option, only boolean ond string options are supported now
		options=["option1","option2"] # if the type is a string, the options for the string picker
	}
	```
	
	c connect the option_changed signal of the template to your option setter method
	d set the `get_setting_method` property of the template to your option setter method
	e call set_layout on the template, then return the template

You can also look at the `generate_mod_settings_page` function in the foggy_glasses' mod.gd

You are expected to save the options for your mod in your own mod's save data, the framework will not save them for you.
