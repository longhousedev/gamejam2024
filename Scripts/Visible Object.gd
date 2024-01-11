class_name Visible extends Node2D

var is_visible:bool;
@export var body:CollisionObject2D;
var activeLayer:int = 1;
var inactiveLayer:int = 2;
# Allows you to set if object is visible
func set_visibility(new_visibility:bool):
	is_visible = new_visibility
	if(is_visible):
		body.set_collision_layer_value(activeLayer,true);
		body.set_collision_layer_value(inactiveLayer,false);
	else:
		body.set_collision_layer_value(inactiveLayer,true);
		body.set_collision_layer_value(activeLayer,false);


# Called when the node enters the scene tree for the first time.
func _ready():
	set_visibility(false);
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
