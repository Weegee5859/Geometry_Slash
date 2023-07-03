extends "res://CollisionBoxes/CollisionBox.gd"
class_name HitboxComponent

@export var damage: DamageComponent
@export var deleteOriginOnContact: bool

@export var can_deflect: bool

@export var is_physical_attack: bool
@export var is_projectile_attack: bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body."hitstun"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not weakref(origin).get_ref(): return
	if not active: return
	for body in self.get_overlapping_areas():
		
		if body is HurtboxComponent:
			if is_projectile_attack and body.is_invincible_to_projectile_attacks: continue
			if is_physical_attack and body.is_invincible_to_physical_attacks: continue
			# If the hurtbox is owned by the owner of this hitbox
			# Ignore, other it will hurt itself
			if body.origin == origin: continue
			# If the hurtbox is disabled/inactive don't do anything
			if not body.active: continue
			# If this hitbox belongs to an enemy and
			# the hurtbox belongs to enemy then...
			# dont hurt another enemys
			if body.isEnemyBox == isEnemyBox: continue
			# If the hurtbox component is connect to a health component
			# take damage
			if body.health_component:
				body.health_component.takeDamage(damage)
			# If the hitstun state and state machine is connected to the
			# hurtbox state, then send hitstun datas
			if body.hitstun_state and body.state_machine:
				if weakref(origin).get_ref():
					body.hitstun_state.processDamage(damage,origin.position)
					body.state_machine.changeState("hitstunstate")
			# Deleting Self
			if deleteOriginOnContact:
				self.get_parent().queue_free()
			
			print("============================================")
			print(body.isEnemyBox)
			print(isEnemyBox)
