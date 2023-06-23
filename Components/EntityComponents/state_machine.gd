extends Node2D
class_name StateMachine
@onready var states: Dictionary
@onready var current_state: State
@onready var prev_states: Array[State]
@export var host: CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		print(child)
		if child is State:
			child.state_machine = self
			states[child.name.to_lower()] = child
			
			print(child.name)
			# If no current_state is defined
			# set it to first defined state
			if not current_state:
				current_state = child
	if current_state:
		current_state.enterState()
	else:
		print("StateMachine: No States Given, Deleting self...")
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state:
		current_state.processState(delta)
		
func _physics_process(delta):
	if current_state:
		current_state.physicsProcessState(delta)
		
func changeState(new_states_name: String):
	if not new_states_name.to_lower() in states:
		print("changeState: State doesnt exist in statemachine's state list!")
		return
	if current_state.name.to_lower() == new_states_name.to_lower():
		print("changeState: " + str(current_state.name.to_lower()) + " is already in use!")
		return
	
	#exit current state
	current_state.exitState()
	#Append to previous states array
	addPreviousState(current_state)
	#change state
	current_state = states[new_states_name.to_lower()]
	#Enter State
	current_state.enterState()
	print("CHANGED STATE TO " + str(current_state))
	
func changeToPreviousState():
	changeState(prev_states[prev_states.size()-1].name)
	
func addPreviousState(state: State):
	prev_states.append(state)
	if prev_states.size() > 3:
		prev_states.pop_front()
	print("-------------------------")
	print(prev_states)
