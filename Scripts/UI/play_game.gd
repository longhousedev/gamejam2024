extends Node

var next_scene = preload("res://Levels/TestLevel.tscn").instantiate()

func _on_pressed():
	await get_tree().create_timer(0.5).timeout
	# Removes the Main Menu from the SceneManager
	get_parent().get_parent().queue_free()
	get_tree().root.add_child(next_scene)
