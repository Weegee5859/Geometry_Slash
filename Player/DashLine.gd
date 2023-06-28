extends Line2D
@export var target: CharacterBody2D
@export var length: int = 10
@onready var point
@onready var enable_trail: bool

func _process(delta):
	if not target: return
	if not enable_trail: return
	global_position = Vector2(0,0)
	print(get_point_count())
	add_point(target.global_position)
	if get_point_count() > length:
		remove_point(0)
	if get_point_count() <= length and enable_trail == false:
		remove_point(0)
	
