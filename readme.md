# Pronoun Palace Spell Framework

The Foggy Glasses are included in this repo as an example of a mod which uses the framework

> [!NOTE]
> The framework requires a specific version of Pronoun Palace to work. The version will be shown on the release page and you will see a popup when starting the game on an unsupported version

## How to make you own spell

1. Make up an spell id for you spell. They are usually in snake case (foggy_glasses). Any instances of `spell_id` should be replaced with whatever id you chose
2. Make the strings file for your spell in `res://strings/spell/spell_id`
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
