extends CharacterBody2D

# Const variables
const SPEED = 64.0
const TURN_SPEED = 2
const ROTATE_SPEED = 20

# Reference to another object, which we can define in Inspector section
@export var weapon: Node2D;

# References to our nodes
#
# You can drag end drop this items to get references names, 
# or drop with ctrl + alt shortcut to genereate all sentence @onready
@onready var sprite := $BodySprite
@onready var collistion := $CollisionShape2D
@onready var animation := $AnimationPlayer

var direction := Vector2.RIGHT

func _physics_process(delta: float): 
	var input_direction := Input.get_vector("turn_left", "turn_right", "move_backward", "move_forward")
	if input_direction.x != 0:
		# Rotate
		# We create vector2 of  
		direction = direction.rotated(input_direction.x * (PI / 2) * TURN_SPEED * delta )
		rotation = direction.angle()
	if input_direction.y != 0:
		# Move forward
		animation.play("Move")
		velocity = lerp(velocity, (direction.normalized() * input_direction.y) * SPEED, SPEED * delta)
	else:
		# Stop moving
		animation.play("RESET")
		velocity = Vector2.ZERO
	
	#Apply velocity to move
	move_and_slide();
func _input(event: InputEvent):
	pass
