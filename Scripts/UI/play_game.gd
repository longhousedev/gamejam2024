extends Node

var next_scene = preload("res://Levels/TestLevel.tscn").instantiate()

func _on_pressed():
	await get_tree().create_timer(1.0).timeout
	get_tree().root.add_child(next_scene)
