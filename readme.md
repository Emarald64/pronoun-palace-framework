# Pronoun Palace Spell Framework

The Foggy Glasses are included in this repo as an example of a mod which uses the framework.   
The foggy glasses are based off the Dyslexic character by [Soƒti](https://bsky.app/profile/softisafe.bsky.social)

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
	removes_word discharge_on_load character spacific(one of: lexographer,child)
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
	Enemy phonebook
```

(as of now the phonebook is not altered but that may be in a future update)
3. Create a scene and script for your enemy in `res://source/enemies` named enemy_id.tscn and enemy_id.gd.
The enemy script should extend Enemy. Look at the vanilla enemies and the paparazzi scripts for examples
4. Create the scene for your enemy sprite `res://source/enemies/sprites/enemy_id_sprite.tscn`. It should be an inherited scene of `res://source/battle_unit_sprite.tscn` 
The AnimPlayer must have a flinch animation and should preferably have a dying and die animation as well as any animations for attacks
5. In your mod script call `load("res://mods/framework/enemy_loader.gd").add_enemy("enemy_id",act,floor)` replacing act and floor with the act and postition in the act that your enemy will appear in respecively.
