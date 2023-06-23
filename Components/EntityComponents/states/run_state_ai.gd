extends "res://Components/EntityComponents/state.gd"
@export var enemy: CharacterBody2D

func physicsProcessState(delta):
	if enemy and Global.players[0]:
		var dir = (Global.players[0].position - enemy.position).normalized()
		enemy.velocity = dir * 10
		enemy.move_and_slide()
