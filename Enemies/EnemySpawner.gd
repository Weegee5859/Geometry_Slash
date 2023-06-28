extends Node2D

@export var enemies: Array[PackedScene]
@export var min_cooldown: int = 1
@export var max_cooldown: int = 1
@onready var timer = $Timer

func _ready():
	timer.wait_time = randi_range(min_cooldown,max_cooldown)
	timer.start()
	print("starting timer...")
	

func _process(delta):
	if enemies and timer.is_stopped():
		var random: int = randi_range(0,enemies.size()-1)
		var instance = enemies[random].instantiate()
		instance.position = position
		get_parent().add_child(instance)
		# Reset Timer
		timer.wait_time = randi_range(min_cooldown,max_cooldown)
		timer.start()


func _on_timer_timeout():
	pass
	
