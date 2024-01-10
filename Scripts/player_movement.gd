extends CharacterBody2D

@export var SPEED = 300.0
@export var ROTATION_SPEED = 4
var mouse_enabled = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var numRayCasts:int;
@export var rayCastAngle:float;
@export var rayLength:int;
var rayCasts:Array = [];

func _physics_process(delta):
	
	# Get rotation
	# First check if we are using the mouse or the keyboard for rotation	
	if Input.is_action_just_pressed("enable_mouse"):
		mouse_enabled = !mouse_enabled
	if mouse_enabled:
		look_at(get_global_mouse_position())
	else:
		var rotate_direction = Input.get_axis("rotate_anticlock", "rotate_clock")
		rotation += rotate_direction * ROTATION_SPEED * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED

	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("enemy"):
			print("I hit an enemy!")
			queue_free()

func rayCasting():
	rayCasts.clear();
	var vector:Vector2 = Vector2(rayLength,0);
	var space_rid = get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
	for i in numRayCasts:
		vector = vector.rotated((rayCastAngle/numRayCasts)*i)
		var query = PhysicsRayQueryParameters2D.create(position, position+vector)
		rayCasts.append(query);
	
	for x in numRayCasts:
		var query = rayCasts[x]
		var result = space_state.intersect_ray(query)
