extends "res://source/enemies/nobody.gd"

# this is meant as a place holder only. If you making your own real character, you should have your own nobody script

#var character_loader=load("res://mods/framework/character_loader.gd")

func _ready():
	super._ready()
	next_move = "expand_board"
	
func _get_health_scaling():
	return Enemies.NOBODY_HEALTH_SCALING[Globals.CHARACTERS.LEXICOGRAPHER]

func advance_cutscene() -> void :
	active_cutscene_index += 1
	var str_index: = str(active_cutscene_index)
	if not active_cutscene.has_string_at_path([str_index]):
		await finish_cutscene()
		return

	var previous_bubble_nobody: = not next_bubble_nobody

	var line_flags: = PackedStringArray()
	if active_cutscene.has_string_group(str_index):
		if active_cutscene.has_string_at_path([str_index, "flags"]):
			line_flags = active_cutscene.get_string_at_path([str_index, "flags"]).split(" ")

	if "character" in line_flags:
		next_bubble_nobody = false
	elif "nobody" in line_flags:
		next_bubble_nobody = true

	var should_play_line: = true
	for flag in line_flags:
		if flag.begins_with("spell_"):
			should_play_line = false
			var spell_id: = flag.trim_prefix("spell_")
			for spell in player.get_spells():
				if spell.id == spell_id:
					should_play_line = true
					break

		if flag == "pro_piracy" and not Game.is_steam_inactive():
			should_play_line = false

	if not should_play_line:
		await advance_cutscene()
		return

	var new_bubble: = true
	if active_speech_bubble != null and is_instance_valid(active_speech_bubble):
		if next_bubble_nobody == previous_bubble_nobody:
			new_bubble = false
		else:
			await disappear_speech_bubble()

	if new_bubble:
		if next_bubble_nobody:
			active_speech_bubble = sprite.spawn_speech_bubble()
		else:
			active_speech_bubble = player.sprite.spawn_speech_bubble()

		if next_bubble_nobody:
			reset_speech_bubble()
			await active_speech_bubble.appear(&"appear_nobody")
		else:
			#var frame: = Globals.CHARACTER_ORDER.find(player.id) + 2
			set_speech_bubble_sprite()
			await active_speech_bubble.appear(&"appear_character")

	next_bubble_nobody = not next_bubble_nobody

	var cutscene_string: = active_cutscene.get_string_at_path([str_index], {trans = player.is_trans()})
	var cutscene_control_string: = active_cutscene.get_string_at_path([str_index], {control = true, trans = player.is_trans()})
	active_speech_bubble.type_text(cutscene_string, cutscene_control_string, "cutoff" not in line_flags)

	if "cutoff" in line_flags:
		active_speech_bubble.text_playback.finished.connect(_cutoff_speech_bubble, ConnectFlags.CONNECT_ONE_SHOT)

func reset_speech_bubble():
	for path in [^"%Bubble",^"%Tail"]:
		var bubble_sprite:Sprite2D=active_speech_bubble.get_node(path)
		bubble_sprite.hframes=4
		bubble_sprite.vframes=2


func set_speech_bubble_sprite():
	var bubble:Sprite2D=active_speech_bubble.get_node("%Bubble")
	bubble.hframes=1
	bubble.vframes=1
	bubble.texture=load(CharacterLoader.speech_bubbles[player.id][0])
	
	var tail:Sprite2D=active_speech_bubble.get_node("%Tail")
	tail.hframes=1
	tail.vframes=1
	tail.texture=load(CharacterLoader.speech_bubbles[player.id][1])
