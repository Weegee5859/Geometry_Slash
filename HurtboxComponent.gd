extends "res://CollisionBoxes/CollisionBox.gd"
class_name HurtboxComponent
@export var health_component: HealthComponent
@export var state_machine: StateMachine
@export var hitstun_state: HitstunState


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass