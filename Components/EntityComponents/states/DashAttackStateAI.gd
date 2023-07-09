extends "res://Components/EntityComponents/state.gd"
@export var enemy: CharacterBody2D
@export var dash_speed: float = 400
@onready var direction: Vector2
@onready var timer: int = 50
@onready var default_time: int = 50
@export var finished_state_new_state: String

func enterState():
	#if direction == Vector2(0,0):
	direction = (Global.players[0].position - enemy.position).normalized()
	
func exitState():
	pass
	
func processState(delta):
	pass
	
func physicsProcessState(delta):
	if not enemy: return
	print(timer)
	if timer<=0:
		timer = default_time
		#direction = Vector2(0,0)
		state_machine.changeState(finished_state_new_state)
	enemy.velocity = direction * dash_speed
	enemy.move_and_slide()
	timer-=1
