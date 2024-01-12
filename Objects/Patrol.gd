class_name patrol_state extends Node2D

@export var move_script:enemy_move
@export var waypoint_list:Array
var current_waypoint_idx:int
var current_waypoint_pos:Vector2
var movement_speed: float = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	current_waypoint_idx = 0

func _process(delta):
	
	# Check if current waypoint is reached
	if global_position == waypoint_list[current_waypoint_idx].global_position:
		
		# Check to see if last waypoint
		if waypoint_list.size() == current_waypoint_idx - 1:
			current_waypoint_idx = 0
		else:
			current_waypoint_idx += 1
	
	var destination = waypoint_list[current_waypoint_idx].global_position
	move_script.set_movement_target(destination)
	
	
	
	
