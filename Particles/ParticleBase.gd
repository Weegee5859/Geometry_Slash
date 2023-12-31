extends Node2D
class_name ParticleBase
@export var emit_on_startup: bool = true
@export var delete_when_done_emitting: bool = true
@onready var particle = $GPUParticles2D
@onready var particle_sound = $ParticleSound

func _ready():
	if emit_on_startup:
		particle.emitting = true
		
	if delete_when_done_emitting:
		particle.one_shot = true
		
	if particle_sound:
		particle_sound.play()
	
		
func _process(delta):
	#if particle.emitting:
		#print("im hereeeee")
	if delete_when_done_emitting and particle.emitting == false:
		queue_free()
