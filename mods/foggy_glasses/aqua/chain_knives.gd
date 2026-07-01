@tool
extends Node2D

@export var top:=false
@export var spacing:=33.0
@export var spacing_decrease:=1.25
@export var current_rotation:=0.0
@export var knife_count:=7
@export var start_spacing:=75

static var knife_texture=load("res://mods/foggy_glasses/aqua/knife_fly.png")

const time_skipped=4
#const time_step=0.033
#var last_time:=0.0
var past_rotations:=PackedFloat64Array()
var knives:Array[Sprite2D]=[]
var animating:=false
#var smol:=false

@export var y_limit:=-205.0
@export var limit_floor:=false

signal hit(i:int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	past_rotations.resize(knife_count*time_skipped)
	knives.resize(knife_count)
	var smol=load("res://source/enemies/sprites/aqua_sprite.gd").smol
	for i in knife_count:
		var sprite=Sprite2D.new()
		sprite.texture=knife_texture
		sprite.visible=false
		if not smol:
			sprite.scale=Vector2(1.5,1.5)
		add_child(sprite)
		knives[i]=(sprite)

func spawn_animation()->void:
	const spawn_animation_time=0.3
	animating=true
	for i in len(knives):
		var tween:=get_tree().create_tween()
		knives[i].flip_h=false
		knives[i].show()
		knives[i].rotation=current_rotation
		knives[i].position=Vector2.ZERO
		tween.tween_property(knives[i],"position",Vector2.from_angle(current_rotation)*((i*spacing)+start_spacing),spawn_animation_time)
	await get_tree().create_timer(spawn_animation_time).timeout
	for knife in knives:
		knife.rotation=current_rotation+(PI/2)
		knife.flip_h=top
	animating=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	past_rotations.remove_at(0)
	past_rotations.push_back(current_rotation)
		
	if not animating:
		#current_rotation=get_angle_to(get_global_mouse_position())
		for i in len(knives):
			knives[i].rotation=past_rotations[-1-(i*time_skipped)]+(PI/2)
			knives[i].position=Vector2.from_angle(past_rotations[-1-(i*time_skipped)])*((i*(spacing-spacing_decrease*i))+start_spacing)
			if knives[i].visible and signf(y_limit-knives[i].global_position.y)<0==limit_floor and i>=2 and i<=5:
				knives[i].hide()
				hit.emit(5-i)
