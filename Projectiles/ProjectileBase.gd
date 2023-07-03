extends CharacterBody2D


@export var speed: int = 50
@export var direction: Vector2
@onready var hitbox_component = $HitboxComponent
@onready var hurtbox_component = $HurtboxComponent
@onready var mouse_colliding: bool
@onready var sprite_2d = $Sprite2D
@onready var deflectable_range: float = 150


func _ready():
	direction = Vector2(-1,0)
	
func distanceToPlayer():
	var distance = (Global.players[0].position - self.position).length()
	return distance
	
func showProjectileCanBeDeflected():
	if not hitbox_component.isEnemyBox: return
	# If projectile is in range of player and the hitbox belongs to the enemy
	# change sprite tint
	if distanceToPlayer() <= deflectable_range and hitbox_component.isEnemyBox:
		sprite_2d.modulate = Color(255,255,255,0.2)
		return
	# Sprite returns to normal
	sprite_2d.modulate = Color(1,1,1,1)
	
	
		
	

func _physics_process(delta):
	showProjectileCanBeDeflected()
	velocity = direction * speed
	move_and_slide()
	
func changeEnemyBoxes(new_enemy):
	hitbox_component.isEnemyBox = new_enemy
	hurtbox_component.isEnemyBox = new_enemy

func setNewOrigin(new_origin: CharacterBody2D):
	var temp = new_origin
	hitbox_component.origin = temp
	hurtbox_component.origin = temp


func _on_mouse_click_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if distanceToPlayer() >= deflectable_range: return
		var new_origin = Global.players[0]
		
		if hurtbox_component.isEnemyBox == true:
			# Make projectile go in opposite direction
			hurtbox_component.origin.direction *= -1
			# Increase Projectile speed by 1.5
			hurtbox_component.origin.speed *= 1.5
			changeEnemyBoxes(false)
			# If projectile no longer belongs to enemy, change color
			sprite_2d.modulate = Color(0.1,0.2,0.7,1)
			# Set new origin/owner of projectile to the player who deflected it
			var tmp = self
			hurtbox_component.origin.setNewOrigin(tmp)
