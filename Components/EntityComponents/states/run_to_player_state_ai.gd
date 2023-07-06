extends MoveState

func physicsProcessState(delta):
	getPlayerTarget()
	if not target: return
	if not enemy: return
	
	if inRangeOfPlayer():
		print("dhufdbsifgdbskjfgkdfkjdhfkjdshkj")
		state_machine.changeState(requiredDistanceToPlayerNewState)
		return
	runTowardsTarget()
	enemy.move_and_slide()
