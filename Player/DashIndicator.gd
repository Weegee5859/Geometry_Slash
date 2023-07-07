extends Line2D
@export var target: CharacterBody2D
@export var length: int = 2
@onready var point

func disableTrail():
	self.visible = false

func enableTrail():
	self.visible = true
	
func _process(delta):
	if not target: return
	global_position = Vector2(0,0)
	set_point_position(0,target.global_position)
	set_point_position(1,get_global_mouse_position())
