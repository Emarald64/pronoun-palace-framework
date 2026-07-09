@tool
extends "res://source/ui/credits/primary_credits.gd"

func update() -> void :
	if not StringManager.has_string_group(credit_path):
		return

	var existing_credits: = credits_container.get_children()

	var group: = StringManager.get_string_group(credit_path)
	#var credits: = group.get_ordered_children()
	for credit_group: String in group.groups:
		var credit: PrimaryCredit = existing_credits.pop_front()
		if credit == null:
			credit = PRIMARY_CREDIT_SCENE.instantiate()
			credits_container.add_child(credit)
		var path=group.path_from_origin.duplicate()
		path.append(credit_group)
		credit.credit_path = "/".join(path)

	for credit in existing_credits:
		credit.queue_free()
