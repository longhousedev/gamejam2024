class_name RayCaster extends Node2D

@export var numRayCasts:int;
@export var rayCastAngle:float;
@export var rayLength:int;
@export var offset:int;
var rayCasts:Array = [RayCast2D];
var results:Array = [];
var previousCasts:Array = [];
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func rayCasting(pos:Vector2,angle:float):
	var vector:Vector2 = Vector2(rayLength,0);
	vector = vector.rotated(deg_to_rad(angle));
	var offsetVector:Vector2 = Vector2(offset,0);
	offsetVector = offsetVector.rotated(deg_to_rad(angle));
	var space_rid = get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
	for i in numRayCasts:
		vector = vector.rotated((deg_to_rad(rayCastAngle/numRayCasts)*i))
		offsetVector = offsetVector.rotated((deg_to_rad(rayCastAngle/numRayCasts)*i))
		rayCasts.append(PhysicsRayQueryParameters2D.create(pos+offsetVector, pos+vector,0b00000000_00000000_00000000_00000011,[get_parent()]))
	for i in numRayCasts:
		var query = rayCasts[i];
		var result = space_state.intersect_ray(query)
		if(!result.is_empty()):
			results.append(result["collider"].get_parent());
			
	for result in results:
		if result is Visible:
			result.set_visibility(true)
	print(previousCasts)
	for y in previousCasts:
		if !results.has(y):
			if (y is Visible):
				y.set_visibility(false);
	previousCasts = results.duplicate();
	rayCasts.clear();
	results.clear();
