extends CharacterBody2D

@export var SPEED = 50.0
@export var direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction == Vector2 (0,0):
		direction = Vector2 (randi_range(-1, 1), randi_range(-1, 1))
	pass

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if !get_parent().is_visible:
		velocity = direction * SPEED
		move_and_slide()
