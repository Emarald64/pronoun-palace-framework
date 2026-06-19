extends Node

signal hide

signal options_changed(option_key,option_value)

func back():
    hide.emit()

#func change_option()
