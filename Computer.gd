extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var moving = false;
export var starting_pos = Vector2(75, 300)

func _ready():
	moving = true;
	position = starting_pos

func stop_moving():
	moving = false;
	
func _physics_process(delta):
	if moving:
		position.y = clamp(get_node("../Ball").position.y, 0, get_viewport_rect().size.y)
