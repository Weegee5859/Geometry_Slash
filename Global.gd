extends Node2D

var paused: bool
var players: Array[CharacterBody2D]
var gameover_screen = preload("res://UI/gameover_screen.tscn")
var camera = preload("res://Camera/camera_2d.tscn")
var instantiated_camera = null

var particles: Dictionary = {
	"hit_spark": preload("res://Particles/hit_spark_particle.tscn"),
	"pixel_explosion": preload("res://Particles/pixel_explosion.tscn"),
	"single_slash": preload("res://Particles/single_slash.tscn"),
	"quake_explosion": preload("res://Particles/quake_explosion.tscn"),
	"fireball_explosion": preload("res://Particles/fireball_explosion.tscn")
}

var projectiles: Dictionary = {
	"fireball": preload("res://Projectiles/fireball.tscn")
}

func addCamera():
	var inst = camera.instantiate()
	instantiated_camera = inst
	get_tree().root.get_child(1).add_child(inst)
	#shakeCamera()
	
func shakeCamera(time: float = 0.2):
	var camera = get_tree().root.get_child(1).get_node("Camera")
	if camera:
		camera.startShake(time)
	
func addPlayer(player):
	if player in players: return
	players.append(player)
	
	for i in range(players.size() - 1, -1, -1):
		if players[i] == null:
			players.remove_at(i)
		
func addParticleToWorld(particle_name: String,new_position: Vector2, user):
	if not particle_name in particles: return
	var inst = particles[particle_name].instantiate()
	inst.position = new_position
	#user.add_child(inst)
	get_tree().root.get_child(1).add_child(inst)
	
func addProjectileToWorld(projectile_name: String,new_position: Vector2,new_direction: Vector2):
	if not projectile_name in projectiles: return
	var inst = projectiles[projectile_name].instantiate()
	inst.position = new_position
	inst.direction = new_direction
	#user.add_child(inst)
	get_tree().root.get_child(1).add_child(inst)
	
func gameOver():
	for character in Global.players:
		character.hitbox_component.collision_shape.disabled = true
		character.hurtbox_component.collision_shape.disabled = true
		character.sprite.visible = false
		character.player_glow.visible = false
	Global.paused = true
	var inst = gameover_screen.instantiate()
	get_tree().root.get_child(1).add_child(inst)
