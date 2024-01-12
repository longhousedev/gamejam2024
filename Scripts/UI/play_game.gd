extends Node
@export var gameStats:Stats

func _ready():
	pass;
func _on_pressed():
	gameStats.start_game();
