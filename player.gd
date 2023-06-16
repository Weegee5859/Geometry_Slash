extends CharacterBody2D


var speed: float = 220.0

var click_location: Vector2
var target_location: Vector2
var mouse_is_on_player: bool
var dash = false

var direction: Vector2
var distance: Vector2
var dash_speed: Vector2
func _physics_process(delta):

	if dash:
		distance = (target_location - position)
		dash_speed = distance / 0.08
		velocity = dash_speed
		if distance.length() <= 5:
			print("DASH IS DONE")
			click_location = Vector2(0,0)
			velocity = Vector2(0,0)
			dash = false

		
	if not dash:
		# Click on player
		if Input.is_action_just_pressed("click") and mouse_is_on_player:
			click_location = get_global_mouse_position()
			print(click_location)
		# Click anywhere that's not player
		if Input.is_action_pressed("click") and not mouse_is_on_player and click_location == Vector2(0,0):
			direction = (get_global_mouse_position() - position).normalized()
			distance = (get_global_mouse_position() - position)
			if distance.length() >= 5:
				velocity = direction * speed
			
		else:
			velocity = Vector2(0,0)

		
		if Input.is_action_just_released("click") and not mouse_is_on_player and click_location != Vector2(0,0):
			target_location = get_global_mouse_position()
			print(target_location)
			print(click_location)
			dash = true
			direction = (target_location - position).normalized()
			
		
		
		
		
	#if Input.is_action_just_released("click"):
		#click_location = Vector2(0,0)
		#print(click_location)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")

	move_and_slide()



func dashToPoint(target_locations):
	pass
	
func moveToCursor():
	direction = (click_location - position).normalized()
	velocity = direction * speed
	
func returnDirectionToMouse():
	distance = (get_global_mouse_position() - position)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		pass
		#print(event)


func _on_area_2d_mouse_entered():
	mouse_is_on_player = true
	#print(mouse_is_on_player)


func _on_area_2d_mouse_exited():
	mouse_is_on_player = false
	#print(mouse_is_on_player)
