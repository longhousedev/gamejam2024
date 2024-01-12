extends Visible


@export var sprite:AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_visibility(new_visibility:bool):
	super.set_visibility(new_visibility);
	if sprite != null:
		sprite.visible=new_visibility;
