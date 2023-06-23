extends "res://Components/EntityComponents/state.gd"
class_name HitstunState
@export var entity: CharacterBody2D
@onready var timer: int = 5
@onready var damage: DamageComponent
@onready var target_pos: Vector2

func enterState():
	entity.hurtbox_component.disableBox()

func physicsProcessState(delta):
	#print(damage.knockback)
	
	var direction = (entity.position - target_pos).normalized()
	print(direction)
	print(timer)
	if entity:
		entity.velocity = direction * 100
		timer-=delta
	if timer<=0:
		state_machine.changeState("idlestate")
		state_machine.changeState("idlestateai")
	entity.move_and_slide()

func processDamage(damage: DamageComponent,position: Vector2):
	damage = damage
	target_pos = position
	
func exitState():
	entity.hurtbox_component.enableBox()
	timer = 5
