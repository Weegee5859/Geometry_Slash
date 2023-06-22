extends "res://CollisionBoxes/CollisionBox.gd"
class_name HitboxComponent

@export var Damage: DamageComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body."hitstun"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not active: return
	for body in self.get_overlapping_areas():
		
		
		if body is HurtboxComponent:
			if body.origin == origin: continue
			if body.health_component:
				
				body.health_component.takeDamage()
		#if bodies is hurtbox:
			#hurtbox.takeDamage()
