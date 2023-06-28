extends Area2D
class_name CollisionBox
@export var active: bool = true
@export var origin: CharacterBody2D
@export var isEnemyBox: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func enableBox():
	active = true
	print("ENABLED")

func disableBox():
	active = false
	print("DISABLED")
