@tool
class_name ClownGiftRNG
extends RNG

static var gifts:=Globals.GIFTS.duplicate()

func shuffle(array: Array) -> void:
	array.assign(gifts)
	super(array)
