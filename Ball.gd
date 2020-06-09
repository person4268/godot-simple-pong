extends KinematicBody2D

var velocity = Vector2()
export var rotation_minimum = 10
export var rotation_maximum = 31
export var opposite_side_offset = 300
export var speed = 750
export var starting_pos = Vector2(512, 280)


func _ready():
	position = starting_pos
	
	#Calculate random ball position
	randomize()
	rotation = rand_range(rotation_minimum, rotation_maximum)
	if(floor(randf()*2)):
		rotation += opposite_side_offset
	print("Ball rotation is " + String(rotation))
	
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
