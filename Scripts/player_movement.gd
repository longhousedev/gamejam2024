extends CharacterBody2D


@export var SPEED = 300.0
@export var ROTATION_SPEED = 5
var mouse_enabled = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get rotation
	
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
