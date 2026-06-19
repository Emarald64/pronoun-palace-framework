extends Control

@onready var mod_list=$"Mod list"

func add_menu(name:String,menu:Node):
    var button = Button.new()
    button.text=name
    button.pressed.connect(hide)
    button.pressed.connect(menu.show)
    mod_list.add_child(button)
    
    add_child(menu)
