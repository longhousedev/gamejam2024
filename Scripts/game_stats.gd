extends Node

@export var mouse_enabled = false
@export var deathcount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func enable_mouse(setting):
	mouse_enabled = setting
	
func player_died():
	deathcount += 1
