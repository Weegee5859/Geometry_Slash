extends MoveState

func physicsProcessState(delta):
	getPlayerTarget()
	if not target: return
	if not enemy: return
	
	if inRangeOfPlayer():
		state_machine.changeState(requiredDistanceToPlayerNewState)
		return
	runTowardsTarget(delta)
	enemy.move_and_slide()
