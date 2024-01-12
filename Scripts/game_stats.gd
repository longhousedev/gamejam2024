class_name Stats extends Node

@export var mouse_enabled = false
@export var deathcount = 0
@export var currentLevel = 0;
@export var mainMenu:Control
@export var levels:Array[PackedScene]
var level;
var player;
# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.gameStats = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func enable_mouse(setting):
	mouse_enabled = setting
	
func player_died():
	deathcount += 1
	level.queue_free()
	level = levels[currentLevel].instantiate();
	get_tree().get_root().add_child(level);
func start_game():
	mainMenu.queue_free()
	level = levels[currentLevel].instantiate();
	get_tree().get_root().add_child(level)
func next_level():
	currentLevel+=1;
	level.queue_free()
	level = levels[currentLevel].instantiate()
	get_tree().get_root().add_child(level);
	
