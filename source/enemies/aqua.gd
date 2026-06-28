extends Enemy

var knife_projectile_scene:PackedScene=load("res://mods/foggy_glasses/aqua/AquaKnifeProjectile.tscn")
var swing_sound=load("res://mods/foggy_glasses/aqua/swing.wav")

func _init():
	id="aqua"
	next_move = "knife_throw"

	moves = {
		knife_throw = {
			damage = {
				0: 2,  
				2: 3, 
			}, 
			count={
				0:4,
				1:6,
			},
			next = "slash_tiles", 
		}, 
		slash_tiles = {
			count = {
				0: 2, 
				1: 3, 
			}, 
			next = "knife_throw", 
		}, 
	}

func _ready():
	sprite=$Sprite
	super._ready()

func display_intent():
	if next_move == "knife_throw":
		add_intent(Intent.ATTACK, {damage = moves.knife_throw.damage, count=moves.knife_throw.count})

	elif next_move == "slash_tiles":
		add_intent("slash_wood", {count = moves.slash_tiles.count})

func get_knife_throw_pos()->Vector2:
	return global_position+(Vector2(-5,-29)/ 2 if sprite.smol else 1)

func knife_throw():
	num_projectiles=moves.knife_throw.count
	for i in moves.knife_throw.count:
		anim_player.play("knife throw")

		await sprite.hit
		
		AudioManager.play_sound(swing_sound,1.5)
		var projectile:ArcingProjectile=knife_projectile_scene.instantiate()
		projectile.final_impact=player.get_projectile_target()
		main.add_child(projectile)
		projectile.launch(get_knife_throw_pos(),projectile.final_impact-Vector2.from_angle(randf_range(PI/6,5*PI/6))*80,randf_range(120,160))
		projectile.impacted.connect(_on_projectile_impacted)
		projectile.impacted.connect(hit_player.bind(moves.knife_throw.damage, i==moves.knife_throw.count-1))
		await anim_player.animation_finished
		
	await all_projectiles_impacted
	anim_player.play("idle")
	anim_player.seek(.4)


func slash_tiles():
	anim_player.play("knife throw")
	var outer_column_tiles = get_tiles({
		columns = [0, -1], 
		effect_priority = PURE_EFFECT_PRIORITY, 
	})

	var outer_row_tiles = get_tiles({
		rows = [0, -1], 
		effect_priority = PURE_EFFECT_PRIORITY, 
	})
	
	var outer_tiles = []
	for tile in outer_column_tiles + outer_row_tiles:
		if tile not in outer_tiles:
			outer_tiles.append(tile)

	rng.move.shuffle(outer_tiles)
	
	for tile in outer_tiles.duplicate():
		if tile.type == TileType.DEFENSE:
			outer_tiles.erase(tile)
			outer_tiles.append(tile)


	while outer_tiles.size() > moves.slash_tiles.count:
		outer_tiles.pop_front()

	rng.move.shuffle(outer_tiles)
	
	await sprite.hit
	AudioManager.play_sound(swing_sound,1.5)
	for tile:Tile in outer_tiles:
		var projectile:ArcingProjectile=knife_projectile_scene.instantiate()
		projectile.final_impact=tile.get_coords_position()
		main.add_child(projectile)
		
		# get first projectile impact location
		var angle:float=(projectile.final_impact-tile_board.global_position).angle()
		angle=angle+randf_range(-PI/4,PI/4)
		var first_impact=projectile.final_impact+Vector2.from_angle(angle)*50
		
		projectile.launch(get_knife_throw_pos(),first_impact,randf_range(100,140))
		projectile.impacted.connect(_on_projectile_impacted)
		projectile.impacted.connect(apply_wooden_slash.bind(tile))
	await all_projectiles_impacted
	
	anim_player.play("idle")
	anim_player.seek(.4)

func apply_wooden_slash(tile:Tile)->void:
	AudioManager.play_sound(swing_sound,.75)
	tile.apply_slashed(rng.move)
	tile.set_type(TileType.DAMAGE)

#func _on_projectile_impacted(damage:=0,last:=false)->void:
	#hit_player(damage, last)
	#super._on_projectile_impacted()

func play_battle_music(_from_save: = false, _skipping_transition: = false) -> void :
	AudioManager.play_music({LOOP=load("res://mods/foggy_glasses/aqua/miniboss_new_section_idea_wip.ogg")})
