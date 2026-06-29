extends Node2D

signal hit(idx:int,top:bool)

var chains:Array[Node2D]=[]
@export var chains_visible:=false:
	set(value):
		for chain in chains:
			chain.visible=value

@export var current_rotation:=0.0:
	set(value):
		for child in chains:
			child.current_rotation=value * (-1 if child.top else 1)

func _ready():
	var current_scene=get_tree().current_scene
	if current_scene is Main:
		for child in get_children():
			child.reparent(current_scene)
			chains.append(child)
	for i in 2:
		chains[i].hit.connect(hit.emit.bind(i==0))

func spawn_animation():
	for child in chains:
		child.spawn_animation()
