extends "res://CollisionBoxes/CollisionBox.gd"
class_name HurtboxComponent
@export var health_component: HealthComponent
@export var state_machine: StateMachine
@export var hitstun_state: HitstunState

@export var isDeflectable: bool

@export var is_invincible_to_physical_attacks: bool
@export var is_invincible_to_projectile_attacks: bool


func setProjectileInvincibility(status: bool):
	is_invincible_to_projectile_attacks = status
	
func setPhysicalAttackInvincibility(status: bool):
	is_invincible_to_physical_attacks = status

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
