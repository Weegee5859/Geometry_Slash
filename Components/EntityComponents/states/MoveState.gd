extends State
class_name MoveState
@export var enemy: CharacterBody2D
@onready var target: CharacterBody2D
# Player within Range
@export var requiredDistanceToPlayer: int = 0
@export var requiredDistanceToPlayerNewState: String
#@export var distance_new_state: String

func physicsProcessState(delta):
	pass

func getPlayerTarget():
	if Global.players.size()>0:
		target = Global.players[0]
		
func runTowardsTarget(delta):
	var dir = (target.position - enemy.position).normalized()
	#enemy.velocity.x = move_toward(0, enemy.velocity.x*enemy.speed, 3)
	#enemy.velocity = dir * enemy.speed
	enemy.velocity = lerp(enemy.velocity, dir * enemy.speed, 0.2)
	
func returndistanceToPlayer():
	var dis = (target.position - enemy.position)
	return dis.length()
	
func inRangeOfPlayer():
	if requiredDistanceToPlayer > 0 and returndistanceToPlayer() <= requiredDistanceToPlayer:
		return true
	return false
