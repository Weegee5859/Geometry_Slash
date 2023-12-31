extends Node2D
class_name HealthComponent
@export var max_health: int = 100
@export var current_health: int
@export var character: CharacterBody2D
@export var death_particle_effect: String = "quake_explosion"


# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func takeDamage(damage: DamageComponent,damage_origin: CharacterBody2D=null):
	print("took damage " + str(damage.damage) + " from " + str(damage_origin))
	current_health -= damage.damage
	
	if current_health >= max_health:
		current_health = max_health
	
	if current_health <= 0 and character:
		die(damage_origin)
		
func die(cause_of_death: CharacterBody2D = null):
	# If character is not given, character can't die
	if not character: return
	# Give cause of death credit for kill
	if cause_of_death:
		if "got_kill" in cause_of_death:
			cause_of_death.got_kill = true
	
	if character in Global.players:
		Global.gameOver()
	else:
		Global.addParticleToWorld(death_particle_effect,character.position,character)
		character.queue_free()
		
