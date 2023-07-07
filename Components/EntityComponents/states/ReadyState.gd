extends "res://Components/EntityComponents/state.gd"
@export var player: CharacterBody2D
@export var dash_indicator: Line2D

func enterState():
	dash_indicator.visible = true

func physicsProcessState(delta):
	if not Input.is_action_pressed("click"):
		state_machine.changeState("idlestate")
		
	if not Input.is_action_pressed("click") and not player.mouse_is_on_player:
		# If no dashes available, go back to idle
		if player.outOfDashes():
			state_machine.changeState("idlestate")
			return
		# set target location for dash State
		player.target_location = get_global_mouse_position()
		print(player.target_location)
		player.direction = (player.target_location - player.position).normalized()
		state_machine.changeState("dashState")

func exitState():
	dash_indicator.visible = false
