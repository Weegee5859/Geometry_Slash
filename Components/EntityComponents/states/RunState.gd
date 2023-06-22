extends "res://Components/EntityComponents/state.gd"
@export var player: CharacterBody2D

func enterState():
	print("entered movementState")

func physicsProcessState(delta):
	player.direction = (player.get_global_mouse_position() - player.position).normalized()
	player.distance = (player.get_global_mouse_position() - player.position)
	# If player is within int length of cursor or left mouse button is let go
	# Go back to idling
	if player.distance.length() <= 5 or not Input.is_action_pressed("click"):
		state_machine.changeState("idlestate")
	# Move Player in direction
	player.velocity = player.direction * player.speed
	player.move_and_slide()
		
