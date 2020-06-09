extends KinematicBody2D

export var can_move = false
export var speed = 400
export var starting_pos = Vector2(949, 300)

func _ready():
	can_move = true
	position = starting_pos

func stop_moving():
	can_move = false

func _physics_process(delta):
	var velocity = Vector2(0, 0)
	if(Input.is_action_just_pressed("ui_select")):
		get_node("../Ball").show()
		get_node("../Ball")._ready()
		get_node("../Computer")._ready()
		_ready()
	if(Input.is_action_pressed("ui_up") and can_move):
		velocity.y -= 1
	if(Input.is_action_pressed("ui_down") and can_move):
		velocity.y += 1
	velocity = velocity.normalized() * speed * delta
	position.y += velocity.y
	position.y = clamp(position.y, 0, get_viewport_rect().size.y)
