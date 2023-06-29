extends "res://Components/EntityComponents/state.gd"
@export var enemy: CharacterBody2D
@onready var target: CharacterBody2D
# Player within Range
@export var requiredDistanceToPlayer: int = 200
@export var distance_new_state: String

func physicsProcessState(delta):
	getPlayerTarget()
	if not target: return
	if not enemy: return
	runTowardsTarget()
	if inRangeOfPlayer():
		state_machine.changeState("DashAttackStateAI")
	enemy.move_and_slide()

func getPlayerTarget():
	if Global.players.size()>0:
		target = Global.players[0]
		
func runTowardsTarget():
	var dir = (target.position - enemy.position).normalized()
	enemy.velocity = dir * enemy.speed
	
func returndistanceToPlayer():
	var dis = (target.position - enemy.position)
	return dis.length()
	
func inRangeOfPlayer():
	if requiredDistanceToPlayer > 0 and returndistanceToPlayer() <= requiredDistanceToPlayer:
		return true
	return false
