extends "res://Components/EntityComponents/state.gd"
@export var enemy: CharacterBody2D

func physicsProcessState(delta):
	enemy.velocity = Vector2(0,0)
