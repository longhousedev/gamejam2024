class_name Player_Movement extends CharacterBody2D

@export var SPEED = 300.0
@export var ROTATION_SPEED = 4
var mouse_enabled = false
@export var rayCaster:RayCaster
@export var light:PointLight2D
var dead = false;
var gameStats:Stats
var mirror:Mirror;
var grabbed:bool = false;
var rotationAmount = 0;
func _ready():
	GameManager.player = self;
func _physics_process(delta):
	
	# Get rotation
	# First check if we are using the mouse or the keyboard for rotation	
	if !dead:
		if Input.is_action_just_pressed("enable_mouse"):
			mouse_enabled = !mouse_enabled
		if mouse_enabled:
			look_at(get_global_mouse_position())
		else:
			var rotate_direction = Input.get_axis("rotate_anticlock", "rotate_clock")
			rotationAmount = rotate_direction * ROTATION_SPEED * delta
			light.rotate((rotationAmount))
		if Input.is_action_just_pressed("Grab"):
			grab();
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = input_direction * SPEED
	else:
		velocity = velocity * 0
	
	
	move_and_slide()
	
	##raycasting
	rayCaster.rayCasting(global_position,light.rotation_degrees-90);
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if(collision != null):
			if collision.get_collider().is_in_group("enemy"):
				if !dead:
					dead = true
					print("I hit an enemy!")
					await get_tree().create_timer(1.0).timeout
					GameManager.gameStats.player_died();

func canGrab(newMirror:Mirror):
	mirror = newMirror

func cannotGrab(newMirror:Mirror):
	if(newMirror == mirror):
		mirror == null;
func grab():
	if mirror != null:
		if grabbed:
			mirror.release();
			grabbed = false;
		else:
			mirror.grab();
			grabbed = true;
