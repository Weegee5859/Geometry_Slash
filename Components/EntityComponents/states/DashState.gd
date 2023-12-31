extends "res://Components/EntityComponents/state.gd"
@export var player: CharacterBody2D
@export var dash_trail: Line2D
@export var health_component: HealthComponent

func _ready():
	player.resetDashes()

func enterState():
	player.hitbox_component.enableBox()
	#player.hurtbox_component.disableBox()
	player.hurtbox_component.setPhysicalAttackInvincibility(true)
	# Update amount of dashes
	player.deincrementDashAmount()
	

func physicsProcessState(delta):
	if dash_trail:
		dash_trail.enableTrail()
	player.distance = (player.target_location - player.position)
	player.dash_speed = player.distance / 0.07
	player.velocity = player.dash_speed
	player.move_and_slide()
	
	if player.distance.length() <= 5:
		player.velocity = Vector2(0,0)
		state_machine.changeState("idlestate")
	

func exitState():
	print("exitting my lineee")
	if player.got_kill:
		player.incrementDashAmount()
		if health_component:
			var tmp_dmp = DamageComponent.new()
			tmp_dmp.damage = -2
			health_component.takeDamage(tmp_dmp)
		player.got_kill = false
	player.hitbox_component.disableBox()
	#player.hurtbox_component.enableBox()
	player.hurtbox_component.setPhysicalAttackInvincibility(false)
	dash_trail.disableTrail()



func _on_dash_timer_timeout():
	player.incrementDashAmount()
	print("added to dash")
