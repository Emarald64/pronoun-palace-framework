extends Node2D

@export var frame:=0:
	set(value):
		$back.frame=value
		$front.frame=value+10
