extends "res://Components/EntityComponents/state.gd"

@export var entity: CharacterBody2D
@export var amount_of_projectiles: int
@onready var current_amount_of_projectiles: int = 0
@export var projectile_name: String
@export var next_state: String
@export var projectile_rate: float
@onready var projectile_rate_timer: float = 0
@onready var cooldown_default: int = 50
@onready var current_cooldown: int = 0
@onready var init_projectile_position_offset: float = 65

func enterState():
	current_cooldown = cooldown_default
	return
	if projectile_rate >= 0:
		projectile_rate_timer = projectile_rate

func processState(delta):
	if current_cooldown > 0:
		current_cooldown -= 1
		
		return
	projectile_rate_timer -= 1
	print(projectile_rate_timer)
	# Projectile timer ran out
	if projectile_rate_timer <= 0:
		current_amount_of_projectiles -= 1
		var direction_to_player = (Global.players[0].position-entity.position).normalized()
		Global.addProjectileToWorld(projectile_name,entity.position+(direction_to_player*init_projectile_position_offset),direction_to_player)
		projectile_rate_timer = projectile_rate
		if current_amount_of_projectiles <= 0:
			print("DONE WITH PROJECTILES")
			state_machine.changeState("runstateai")
			return
			
func exitState():
	current_cooldown = cooldown_default
