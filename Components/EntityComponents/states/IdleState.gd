extends "res://Components/EntityComponents/state.gd"
@export var player: CharacterBody2D

func physicsProcessState(delta):
	# If you click on player, player is ready to attack
	if Input.is_action_just_pressed("click") and player.mouse_is_on_player:
		state_machine.changeState("readyState")
		#playerIsReadyToAttack = true
		#print(playerIsReadyToAttack)
# Click anywhere that's not player
	if Input.is_action_pressed("click") and not player.mouse_is_on_player:
		state_machine.changeState("runState")
	else:
		player.velocity = Vector2(0,0)
