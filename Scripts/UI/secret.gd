extends Node
@export var secret:Sprite2D
var clickcount = 0

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		
		if clickcount < 10:
			clickcount += 1
		if clickcount == 10:
			secret.visible = true
