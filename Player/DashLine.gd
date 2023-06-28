extends Line2D
@export var target: CharacterBody2D
@export var length: int = 10
@onready var point

func disableTrail():
	print("disballed")
	self.visible = false

	
func enableTrail():
	self.visible = true
	
func _process(delta):
	if not target: return
	global_position = Vector2(0,0)
	add_point(target.global_position)
	if get_point_count() > length:
		remove_point(0)

	
