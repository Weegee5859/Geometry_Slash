extends "res://Components/EntityComponents/state.gd"
@export var player: CharacterBody2D
@export var dash_trail: Line2D

func enterState():
	player.hitbox_component.enableBox()
	player.hurtbox_component.disableBox()

func physicsProcessState(delta):
	player.distance = (player.target_location - player.position)
	player.dash_speed = player.distance / 0.07
	player.velocity = player.dash_speed
	player.move_and_slide()
	if player.distance.length() <= 5:
		player.velocity = Vector2(0,0)
		state_machine.changeState("idlestate")
	if dash_trail:
		dash_trail.enable_trail = true

func exitState():
	player.hitbox_component.disableBox()
	player.hurtbox_component.enableBox()
	dash_trail.enable_trail = false
