extends Player


func _init():
 id = "dew_jubilist"
 starting_spells = [SPELLS.VERIFICATION_CAN]


func get_gender():
 #if is_trans():
  #return Gender.NONBINARY
 #else:
  return Gender.FEMALE
