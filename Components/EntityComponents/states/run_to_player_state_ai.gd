extends MoveState

func physicsProcessState(delta):
	getPlayerTarget()
	if not target: return
	if not enemy: return
	runTowardsTarget()
	if inRangeOfPlayer():
		state_machine.changeState(requiredDistanceToPlayerNewState)
	enemy.move_and_slide()
