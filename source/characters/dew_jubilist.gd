extends Player


func _init():
 id = "dew_jubilist"
 starting_spells = ["dew_jubilist_verification_can"]


func get_gender():
 #if is_trans():
  #return Gender.NONBINARY
 #else:
  return Gender.FEMALE
