extends CharacterBody2D


@export var speed: int = 50
@export var direction: Vector2
@onready var hitbox_component = $HitboxComponent
@onready var hurtbox_component = $HurtboxComponent


func _ready():
	direction = Vector2(-1,0)

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
	
func changeEnemyBoxes(new_enemy):
	hitbox_component.isEnemyBox = new_enemy
	hurtbox_component.isEnemyBox = new_enemy

func setNewOrigin(new_origin: CharacterBody2D):
	var temp = new_origin
	hitbox_component.origin = temp
	hurtbox_component.origin = temp
