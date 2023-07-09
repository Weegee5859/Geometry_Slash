extends "res://Components/EntityComponents/state.gd"
class_name HitstunState
@export var entity: CharacterBody2D
@export var knockback_resistent: bool
@onready var hitstun_timer: int = 5
@onready var damage: DamageComponent
@onready var target_pos: Vector2


func enterState():
	# Init hitstun Timer
	if weakref(damage).get_ref():
		hitstun_timer = damage.hitstun * 5
	
	entity.hurtbox_component.disableBox()
	#hitflash
	if entity.sprite.material.get_shader_parameter("enabled") != null:
		entity.sprite.material.set_shader_parameter("enabled", true)
	# Particle
	print(self.entity)
	
	Global.addParticleToWorld("pixel_explosion",entity.position,self)

func physicsProcessState(delta):
	
		
	var direction = (entity.position - target_pos).normalized()
	print(direction)
	print(hitstun_timer)
	if entity:
		if weakref(damage).get_ref():
			if not knockback_resistent:
				entity.velocity = direction * (100*damage.knockback)
		hitstun_timer-=delta
	if hitstun_timer<=0:
		state_machine.changeToPreviousState()
		#state_machine.changeState("idlestate")
		#state_machine.changeState("idlestateai")
	entity.move_and_slide()

func processDamage(new_damage: DamageComponent,position: Vector2):
	damage = new_damage
	target_pos = position
	
	
func exitState():
	entity.hurtbox_component.enableBox()
	#hitflash
	if entity.sprite.material.get_shader_parameter("enabled") != null:
		entity.sprite.material.set_shader_parameter("enabled", false)
	#hitstun_timer = 5
