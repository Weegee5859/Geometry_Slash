extends "res://Components/EntityComponents/state.gd"
class_name HitstunState
@export var entity: CharacterBody2D
@onready var timer: int = 5
@onready var damage: DamageComponent
@onready var target_pos: Vector2

func enterState():
	entity.hurtbox_component.disableBox()
	#hitflash
	if entity.sprite.material.get_shader_parameter("enabled") != null:
		entity.sprite.material.set_shader_parameter("enabled", true)

func physicsProcessState(delta):
	#print(damage.knockback)
	
	var direction = (entity.position - target_pos).normalized()
	print(direction)
	print(timer)
	if entity:
		entity.velocity = direction * 100
		timer-=delta
	if timer<=0:
		state_machine.changeToPreviousState()
		#state_machine.changeState("idlestate")
		#state_machine.changeState("idlestateai")
	entity.move_and_slide()

func processDamage(damage: DamageComponent,position: Vector2):
	damage = damage
	target_pos = position
	
func exitState():
	entity.hurtbox_component.enableBox()
	#hitflash
	if entity.sprite.material.get_shader_parameter("enabled") != null:
		entity.sprite.material.set_shader_parameter("enabled", false)
	timer = 5
