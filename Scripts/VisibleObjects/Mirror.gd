class_name Mirror extends Visible

@export var rayCasts:Array[RayCaster];
@export var offset:int;
@export var sprite:Sprite2D;
@export var light:PointLight2D;
@export var CollisionShape:CollisionShape2D;
var grabbed:bool;
var positionOffset:Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready();
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(is_visible):
		for r in rayCasts.size():
			var pos:Vector2 = global_position+Vector2((r*offset)-offset,0)
			rayCasts[r].rayCasting(pos,global_rotation)
	
func _physics_process(delta):
	if(grabbed):
		position = GameManager.player.global_position + positionOffset

func _on_player_body_entered(body):
	if body == GameManager.player:
		GameManager.player.canGrab(self);

func set_visibility(new_visibility:bool):
	super.set_visibility(new_visibility);
	sprite.visible=new_visibility;
	light.visible = new_visibility;
	if(!is_visible):
		for r in rayCasts:
			for p in r.previousCasts:
				if(p!=self && p is Visible):
					p.set_visibility(false);


func _on_player_body_exited(body):
	if body == GameManager.player:
		GameManager.player.cannotGrab(self);

func grab():
	grabbed = true;
	positionOffset =global_position-GameManager.player.global_position
	set_visibility(true);
	CollisionShape.disabled = true;
	pass;
func release():
	grabbed = false;
	set_visibility(false);
	CollisionShape.disabled = false;
	pass;
