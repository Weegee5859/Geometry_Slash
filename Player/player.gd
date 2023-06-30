extends CharacterBody2D


@onready var hitbox_component = $DashHitboxComponent
@onready var hurtbox_component = $HurtboxComponent

@onready var speed: float = 220.0

@onready var playerIsReadyToAttack: bool
@onready var target_location: Vector2
@onready var mouse_is_on_player: bool
@onready var dash = false

@onready var direction: Vector2
@onready var distance: Vector2
@onready var dash_speed: Vector2

@onready var sprite = $Sprite2D

@onready var sword_slash_base = $SwordSlashBase
@onready var sword_hitbox_component = $SwordSlashBase/HitboxComponent

@onready var mouse_distance: float

func _ready():
	Global.addPlayer(self)
	

func _physics_process(delta):
	mouse_distance = (get_global_mouse_position() - position).length()	
	sword_slash_base.rotation = get_angle_to(get_global_mouse_position())

	return
	if dash:
		pass

		
	if not dash:
		pass
		
	

			
		
		
		
		
	#if Input.is_action_just_released("click"):
		#playerIsReadyToAttack = Vector2(0,0)
		#print(playerIsReadyToAttack)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")

	move_and_slide()



func dashToPoint(target_locations):
	pass
	
	
func returnDirectionToMouse():
	distance = (get_global_mouse_position() - position)

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		pass
		#print(event)


func _on_area_2d_mouse_entered():
	mouse_is_on_player = true
	#print(mouse_is_on_player)


func _on_area_2d_mouse_exited():
	mouse_is_on_player = false
	#print(mouse_is_on_player)
