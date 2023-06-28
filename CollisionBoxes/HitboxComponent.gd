extends "res://CollisionBoxes/CollisionBox.gd"
class_name HitboxComponent

@export var damage: DamageComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body."hitstun"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not active: return
	for body in self.get_overlapping_areas():
		
		
		if body is HurtboxComponent:
			
			if body.origin == origin: continue
			if not body.active: continue
			if body.isEnemyBox and isEnemyBox: continue
			if body.health_component:
				body.health_component.takeDamage(damage)
			if body.hitstun_state and body.state_machine:
				body.hitstun_state.processDamage(damage,origin.position)
				body.state_machine.changeState("hitstunstate")
		#if bodies is hurtbox:
			#hurtbox.takeDamage()
