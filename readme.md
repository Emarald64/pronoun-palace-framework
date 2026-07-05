# Pronoun Palace Framework

A mod for Pronoun Palace that allows other mods to add custom spells, enemies, characters, tile effects, and settings menus.

<img width="1580" height="739" alt="Screenshot_20260704_221825" src="https://github.com/user-attachments/assets/d643ffca-94df-4f6b-947f-825c0ea491a2" />

The Foggy Glasses are included in this repo as an example of a mod which uses the framework.   
It adds the spell inverter, the enemy Aqua, the character Dew Jubilist, and the tile affect negative.

Pronoun Palace and this framework are written in Godot, using GDScript. You should know how to use Godot if you want to make mods for this game. You can learn Godot from the offical docs [here](https://docs.godotengine.org/en/stable/getting_started/introduction/index.html) and there are tons of tutorials for it on youtube (though, personally I find video tutorials unhelpful to learn things). 

If you need help learning how to mod Pronoun Palace, check out the guide I made: [How to make Pronoun Palace mods](https://gist.github.com/Emarald64/65943d629b6ff5fd08a2d8022397aacb) or ask me in the \#modding channel in the Pronoun Palace Discord. 

> [!NOTE]
> The framework requires a specific version of Pronoun Palace to work. The version will be shown on the release page and you will see a popup when starting the game on an unsupported version

The guides on how to use the framework have moved to the [wiki tab](https://github.com/Emarald64/pronoun-palace-framework/wiki)

## How to install

### Steam version

Open Pronoun Palace's files by going to Pronoun Palace in steam then pressing Settings -> Manage -> Browse local files.

Create a `mods` folder (case sensitive) next to the executable for Pronoun Palace, then extract both framework.zip and foggy_glasses.zip from the [releases](https://github.com/Emarald64/pronoun-palace-framework/releases) into the `mods` folder.  
The folder structure should look like this
```
Pronoun Palace
|
| pronoun_palace.exe
| mods
| |
| | framework
| | | framework.pck
| | | mod.json
| | 
| | foggy_glasses
| | | foggy_glasses.pck
| | | mod.json
```

### Godot Editor

You must have already extracted the game's files to mod it. How to extract the game's files is included in the [modding guide](https://gist.github.com/Emarald64/65943d629b6ff5fd08a2d8022397aacb)

Download the code for the framework this repo from the source code archive in the latest [release]((https://github.com/Emarald64/pronoun-palace-framework/releases))

Copy the files from the zip into Pronoun Palace's extracted file, overwriting any files if prompted

The .pck files for the framework and foggy glasses mods are not included when cloning the repo. In the editor, the game's mod_loader will not run the scripts for these mods without a .pck file in `res://mod_packs/framework` and `res://mod_packs/foggy_glasses` respectively. Either download them from the realeases page or package them yourself by running the `mod_packer.gd` script in the `res://mods/framework` and `res://mods/foggy_glasses` folders
