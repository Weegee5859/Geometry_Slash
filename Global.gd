extends Node2D

var players: Array[CharacterBody2D]

var particles: Dictionary = {
	"hit_spark": preload("res://Particles/hit_spark_particle.tscn")
}

func addPlayer(player):
	if player in players: return
	players.append(player)
	
	for i in players:
		print(player)
		
func addParticleToWorld(particle_name: String,new_position: Vector2, user):
	if not particle_name in particles: return
	var inst = particles[particle_name].instantiate()
	inst.position = new_position
	#user.add_child(inst)
	get_tree().root.get_child(1).add_child(inst)
