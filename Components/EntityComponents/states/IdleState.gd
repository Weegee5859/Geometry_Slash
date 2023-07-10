extends "res://Components/EntityComponents/state.gd"
@export var player: CharacterBody2D

func enterState():
	player.velocity = Vector2(0,0)

func physicsProcessState(delta):
	if Global.paused:
		return
	# If you click on player, player is ready to attack
	if Input.is_action_just_pressed("click") and player.mouse_is_on_player:
		state_machine.changeState("readyState")
		#playerIsReadyToAttack = true
		#print(playerIsReadyToAttack)
# Click anywhere that's not player
	if Input.is_action_pressed("click") and not player.mouse_is_on_player:
		# if the house is 90 units or more away from the player
		if player.mouse_distance >= 90:
			state_machine.changeState("runState")
		# Otherwise, cursor is close to player
		# So continue to idle but swing sword
		else:			
			player.swordSwipe(true)
	# If your not clikcing anything disable sword hitbox
	if not Input.is_action_pressed("click"):
		player.swordSwipe(false)
		
		
func exitState():
	player.swordSwipe(false)
