extends Visible

@export var rayCasts:Array[RayCaster];
@export var offset:int;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(is_visible):
		for r in rayCasts.size():
			var pos:Vector2 = global_position+Vector2(r*offset,0)
			rayCasts[r].rayCasting(pos,global_rotation)
	


func _on_player_body_entered(body):
	pass # Replace with function body.
