extends "res://Components/EntityComponents/state.gd"
@export var character: CharacterBody2D

func enterState():
	print("entered movementState")

func processState():
	if character:
		pass
		#character.velocity.x = 5
		#print("moveeee")
