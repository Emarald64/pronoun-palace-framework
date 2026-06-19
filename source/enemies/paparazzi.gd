extends Enemy


func _init():
 id="paparazzi"
 next_move = "flash"

 moves = {
  flash = {
   eternal={
    0:1,
    2:2, 
   },
   shimmering={
     0:1,
   },
   next = "peanuts", 
  }, 
  peanuts = {
   damage = {
    0: 2, 
    1: 3, 
    3: 4, 
   }, 
   bruise={
    0:1,
    1:2,
    3:3  
   },
   next = "flash", 
  }, 
 }

func _ready():
    sprite=$Sprite
    super._ready()

func display_intent():
 if next_move == "flash":
  add_intent(Intent.DOUBLESPEAK, {count=moves.flash.shimmering})
  add_intent(Intent.ETERNAL, {count=moves.flash.eternal})

 elif next_move == "peanuts":
  add_intent(Intent.DAMAGE, {damage=moves.peanuts.damage})
  add_intent(Intent.APPLY_STATUS, {status = TileStatus.BRUISE, count = moves.peanuts.bruise})



func flash():
 var eternal_tiles=get_tiles({include_effects = [TileStatus.ETERNAL]})
 var remaining=moves.flash.eternal-eternal_tiles.size()
 if remaining>0:
    var new_tiles=get_tiles({
        amount=remaining,
        type_priority = TileType.DAMAGE,
        effect_priority = DEFAULT_EFFECT_PRIORITY,
    })
    eternal_tiles.append_array(new_tiles)
 for tile:Tile in eternal_tiles:
    tile.add_status(TileStatus.ETERNAL)
    tile.remove_statuses(Globals.FACE_STATUSES)
    tile.apply_slashed(rng.move)
 
 var shimmering_tiles=get_tiles({
    amount=moves.flash.shimmering,
    effect_priority = DEFAULT_EFFECT_PRIORITY
 })
 for tile:Tile in shimmering_tiles:
    tile.apply_shimmering()
    tile.add_status(TileStatus.CRIT)

func peanuts():
 #anim_player.play("attack")

 #await sprite.hit
 var bruse_tiles=get_tiles({
    amount=moves.peanuts.bruise,
    #type_priority = TileType.DAMAGE,
    effect_priority = DEFAULT_EFFECT_PRIORITY,
 })
 for tile:Tile in bruse_tiles:
    tile.add_status(TileStatus.BRUISE)
 deal_damage(player, moves.peanuts.damage)

 #await anim_player.animation_finished

## get enmy health based on current clearence
## index 0: used for beige clearence
## index 1: used for black through teal clearance
## index 2: used for green through red clearence
## index 3: used for hazel clearence
## see enemies.gd HEALTH_SCALING for vanilla values
## if this method is not included, defaults to the fat cat's health values
func _get_health_scaling():
    return [24, 26, 30, 34]
