extends HBoxContainer

@export var player: CharacterBody2D
var node = TextureRect
var dash_sprite = preload("res://Sprites/sword_hit.png")
var dash_sprite_empty = preload("res://Sprites/sword_swipe.png")

func _ready():
	if player:
		for i in player.maximum_dashes:
			var new_node = node.new()
			new_node.texture = dash_sprite
			self.add_child(new_node)
			
func _process(delta):
	updateDashAmount()
			
func updateDashAmount():
	var children = self.get_children()
	var count = 0
	for child in children:
		count += 1
		if count<=player.current_dashes:
			child.texture = dash_sprite
		else:
			child.texture = dash_sprite_empty
