# Pronoun Palace Framework

The Foggy Glasses are included in this repo as an example of a mod which uses the framework.   
It adds the spell foggy glasses, the enemy Aqua, and the character Dew Jubilist  
The foggy glasses are based off the Dyslexic character by [Soƒti](https://bsky.app/profile/softisafe.bsky.social)

Pronoun Palace and this framework are written in Godot, using GDScript. You should know how to use Godot if you want to make mods for this game. You can learn Godot from the offical docs [here](https://docs.godotengine.org/en/stable/getting_started/introduction/index.html) and there are tons of tutorials for it on youtube (though, personally I find video tutorials unhelpful to learn things). 

If you need help learning how to mod Pronoun Palace, check out the guide I made: [How to make Pronoun Palace mods](https://gist.github.com/Emarald64/65943d629b6ff5fd08a2d8022397aacb) or ask me in the \#modding channel in the Pronoun Palace Discord. 

The .pck files for the framework and foggy glasses mods are not included when cloning the repo. In the editor, the mod_loader will not run the scripts for these mods without a .pck file in `res://mod_packs/framework` or `res://mod_packs/foggy_glasses` respectively. Either download them from the realeases page or package them yourself by running the `mod_packer.gd` script in the `mods/framework` and `mods/foggy_glasses` folders

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