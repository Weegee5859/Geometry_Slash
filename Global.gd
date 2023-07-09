extends Node2D

var players: Array[CharacterBody2D]

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
