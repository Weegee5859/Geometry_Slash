extends Camera2D
@onready var shake_intensity: float = 1
@onready var default_shake_time
@onready var camera_shake_timer = $Timer

func _process(delta):
	if not camera_shake_timer.is_stopped():
		shake()

func startShake(time: float = 0.2):
	if camera_shake_timer.is_stopped():
		camera_shake_timer.wait_time = time
		camera_shake_timer.start()
	
func shake():
	offset = Vector2(randf_range(-1,1) * shake_intensity, randf_range(-1,1) * shake_intensity)
