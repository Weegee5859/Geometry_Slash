extends "res://Components/EntityComponents/state.gd"
@export var entity: CharacterBody2D
@onready var timer: int

func physicsProcessState(delta):
	if entity:
		entity.velocity = Vector2(0,0)
		#timer-=delta
