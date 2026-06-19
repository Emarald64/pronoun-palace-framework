class_name SpellFramework extends Mod

const pronoun_palace_version="1.0.23"

static var spell_pool:Dictionary
static var spell_categories:Dictionary=Globals.SPELL_CATEGORIES.duplicate(true)

## Adds a spell to the list of spells that can appear randomly
## A higher weight makes the spell appear more often
## The catagory is used to determine whether it it will appear in the jubilist's boxes 
static func add_spell(id:String,weight:float=1.0,catagory:String="")->void:
    spell_pool[id]=weight
    if catagory!="":
        spell_categories[catagory].append(id)
    print("added spell "+id)
    
static func add_vanillia_spells()->void:
    if spell_pool==null:
        spell_pool={}
    spell_pool.merge(Globals.SPELL_POOL)


func _on_scene_change()->void:
    var current_scene=get_tree().current_scene
            
    if current_scene is MainMenu:
        run_main_menu_additions(current_scene)

func run_main_menu_additions(main_menu:MainMenu):
    var settings_menu_panel=main_menu.get_node("HUD/SettingsMenu/OptionsMenu/PositionRoot/Panel")
    var mod_settings_menu=load("res://mods/framework/mod_settings_menu.tscn").instantiate()
    mod_settings_menu.visible=false
    settings_menu_panel.get_node("SectionedPanel/MainMask/MarginContainer/ScrollContainer/MarginContainer/ContentsBox/Game").add_sibling(mod_settings_menu)
    var tab_info:=TabInfo.new()
    tab_info.string_key="menu/settings/mods"
    tab_info.tab_control=mod_settings_menu.get_path()
    var tab_controller:TabController=settings_menu_panel.get_node("Control/TabController")
    tab_controller.tab_definitions.append(tab_info)
    
    var character_selector=main_menu.get_node("HUD/CharacterSelect/CharacterSelector")
    change_script_and_copy_properties(character_selector,load("res://mods/framework/overrides/character_selector.gd"))
    
    var difficulty_selector=main_menu.get_node("HUD/CharacterSelect/DifficultySelector")
    change_script_and_copy_properties(difficulty_selector,load("res://mods/framework/overrides/difficulty_selector.gd"))

    main_menu.get_node("HUD/PlayMenu/ContinueButton/HoverOffset/Panel/MarginContainer/VBoxContainer/TopContainer/RunIcons/Control2/CharacterIcon")\
    .set_script(load("res://mods/framework/overrides/character_icon.gd"))

    #current_scene.get_node("HUD/Phonebook/PositionRoot/Panel/MarginContainer/Clip/HBoxContainer/MarginContainer/PhonebookSelector").set_script(load("res://mods/framework/script_overrides/phonebook_selector.gd"))
    #print("set phonebook selector_script")

static func change_script_and_copy_properties(object:Object,script:Script):
    # save all properties of main
    var properties:Dictionary[String,Variant]={}
    for property in object.get_property_list():
        if property.name!="script":
            properties[property.name]=object.get(property.name)
    #print(properties)
    print("saved properties")
    object.set_script(script)
    print("changed script")
    #await get_tree().process_frame
    # preset all properties
    for property in properties:
        object.set(property,properties[property])
    print("set properties")

func _ready() -> void:
    add_vanillia_spells()
    load("res://source/spell/spell_data.gd").load_random_charge_spells(spell_pool)
    var current_scene=get_tree().current_scene
    if current_scene is MainMenu:
        run_main_menu_additions(current_scene)
    print("spell_catagories: "+str(spell_categories))
    print("loaded spell framework")
    #print("has globals: "+str(ProjectSettings.has_setting("autoload/Globals")))
    #print("globals path: "+str(ProjectSettings.get_setting("autoload/Globals")))
    if pronoun_palace_version!=ProjectSettings.get_setting("application/config/version"):
        push_warning("The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+") may be incompatible with this version of the framework for "+pronoun_palace_version+". proceed at you own risk")
        var popup=load("res://mods/framework/incompatible_version_popup.tscn").instantiate()
        popup.get_node("Label").text="The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+")\nmay be incompatible with this version of the framework for "+pronoun_palace_version+"\nproceed at you own risk"
        add_child(popup)
    get_tree().scene_changed.connect(_on_scene_change)
    await get_tree().process_frame
    Globals.set_script(load("res://mods/framework/overrides/custom_globals.gd"))
    await get_tree().create_timer(0.5).timeout
    #print(Game.get_path())
    change_script_and_copy_properties(Game,load("res://mods/framework/overrides/custom_game.gd"))
    #print(Game.get_script())
