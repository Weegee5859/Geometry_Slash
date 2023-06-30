extends MoveState

func physicsProcessState(delta):
	getPlayerTarget()
	if not target: return
	if not enemy: return
	idle()
	if inRangeOfPlayer():
		state_machine.changeState(requiredDistanceToPlayerNewState)

func idle():
	enemy.velocity = Vector2(0,0)
