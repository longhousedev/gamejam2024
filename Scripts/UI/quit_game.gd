extends Node

func _on_pressed():
	await get_tree().create_timer(1.0).timeout
	get_tree().quit()
