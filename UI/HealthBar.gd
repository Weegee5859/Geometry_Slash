extends ProgressBar

@export var health_component: HealthComponent


func _process(delta):
	if health_component:
		print(health_component.current_health)
		self.value = health_component.current_health
