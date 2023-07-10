extends Node2D

@export var enemies: Array[PackedScene]
@export var min_cooldown: int = 1
@export var max_cooldown: int = 1
@onready var timer = $Timer
@export var active: bool = true
@export var offset_x: int = 0
@export var offset_y: int = 0

func _ready():
	timer.wait_time = randi_range(min_cooldown,max_cooldown)
	timer.start()
	print("starting timer...")
	

func _process(delta):
	if not active: return
	if Global.paused: return
	if enemies and timer.is_stopped():
		var random: int = randi_range(0,enemies.size()-1)
		var instance = enemies[random].instantiate()
		#instance.position = position
		instance.position.x = randi_range(position.x-offset_x,position.x+offset_x)
		instance.position.y = randi_range(position.y-offset_y,position.y+offset_y)
		get_parent().add_child(instance)
		# Reset Timer
		timer.wait_time = randi_range(min_cooldown,max_cooldown)
		timer.start()


func _on_timer_timeout():
	pass
	
