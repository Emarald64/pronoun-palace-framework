extends BattleUnitSprite

static var smol:=false

func _ready() -> void:
	if smol:
		for child in $Sprite.get_children():
			child.scale=Vector2.ONE
		intent_marker.position.y/=2
		hover_area.scale=Vector2.ONE
		bleed_area.scale=Vector2.ONE

func advance_phonebook_animation() -> void :
	const animations: = ["knife throw","flinch"]

	var animation_index: int = 0
	if playing_phonebook_animation in animations:
		animation_index = animations.find(playing_phonebook_animation) + 1

	if anim_player.has_animation("RESET"):
		anim_player.play_advance("RESET")

	animation_index = posmod(animation_index, animations.size())
	var animation: Variant = animations[animation_index]
	playing_phonebook_animation = animation
	play_phonebook_animation(animation)
