extends Node2D

var current_state: State


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_state.run_behaviour()


func is_state_change():
	
