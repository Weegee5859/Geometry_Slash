extends Node2D
@export var max_health: int = 100
@export var current_health: int


# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func takeDamage():
	pass
