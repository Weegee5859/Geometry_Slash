extends "res://Components/EntityComponents/state.gd"
@export var player: CharacterBody2D

func enterState():
	player.swordSwipe(true)
	print("entered movementState")

func physicsProcessState(delta):
	if Global.paused:
		state_machine.changeState("idlestate")
	#Set player direction and distance
	player.direction = (player.get_global_mouse_position() - player.position).normalized()
	player.distance = (player.get_global_mouse_position() - player.position)
	# If player is within int length of cursor or left mouse button is let go
	# Go back to idling
	if player.distance.length() <= 5 or not Input.is_action_pressed("click"):
		state_machine.changeState("idlestate")
	# if player is specific distance from mouse go to idle
	if player.mouse_distance < 90:
			state_machine.changeState("idlestate")
	# if running enable sword swing
	player.swordSwipe(true)
	# Move Player in direction
	player.velocity = player.direction * player.speed
	player.move_and_slide()

func exitState():
	player.swordSwipe(false)
	
	

	
