extends Visible

@export var rayCasts:Array[RayCaster];
@export var offset:int;
@export var sprite:Sprite2D;
@export var light:PointLight2D;
# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready();
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(is_visible):
		for r in rayCasts.size():
			var pos:Vector2 = global_position+Vector2(r*offset,0)
			rayCasts[r].rayCasting(pos,global_rotation)
	


func _on_player_body_entered(body):
	pass # Replace with function body.

func set_visibility(new_visibility:bool):
	super.set_visibility(new_visibility);
	sprite.visible=new_visibility;
	light.visible = new_visibility;
	if(!is_visible):
		for r in rayCasts:
			for p in r.previousCasts:
				if(p!=self):
					p.set_visibility(false);
