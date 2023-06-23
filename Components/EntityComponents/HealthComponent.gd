extends Node2D
class_name HealthComponent
@export var max_health: int = 100
@export var current_health: int
@export var character: CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func takeDamage(damage: DamageComponent):
	print("took damage " + str(damage.damage))
	current_health -= damage.damage
	
	if current_health <= 0 and character:
		character.queue_free()
