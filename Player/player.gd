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
@onready var sword_sprite = $SwordSlashBase/HitboxComponent/SwordSprite
@onready var sword_animation_player = $SwordSlashBase/HitboxComponent/SwordAnimationPlayer
@onready var can_swing: bool

@onready var mouse_distance: float


func enableSwing():
	sword_hitbox_component.active = true
	sword_sprite.visible = true
	
func disableSwing():
	sword_hitbox_component.active = false
	sword_sprite.visible = false

	
func swordSwipe(canAttack: bool=false):
	if not canAttack:
		disableSwing()
		sword_animation_player.stop()
		return
	#Sword Animation
	enableSwing()
	if not sword_animation_player.is_playing():
		sword_animation_player.play("sword_swipe_both")
	#if sword_animation_player.current_animation == "sword_swipe":
	#	if sword_animation_player.current_animation_position >= sword_animation_player.current_animation_length-0.05:
	#		print("sword swipe 2")
	#		sword_animation_player.play("sword_swipe_2")
	#if not sword_animation_player.is_playing():
	#	sword_animation_player.play("sword_swipe")

func _ready():
	Global.addPlayer(self)
	disableSwing()
	

func _physics_process(delta):
	mouse_distance = (get_global_mouse_position() - position).length()	
	sword_slash_base.rotation = get_angle_to(get_global_mouse_position())
	
	if can_swing:
		pass

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
