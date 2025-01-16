extends CharacterBody2D

# Const variables
const SPEED = 64.0
const TURN_SPEED = 2
const ROTATE_SPEED = 20

# Reference to another object, which we can define in Inspector section
@export var weapon: Weapon

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
		move_and_slide();
	else:
		# Stop moving
		animation.play("RESET")

	
	var wepon_direction := Input.get_axis("rotate_wepon_left", "rotate_wepon_right");
	weapon.make_rotation(wepon_direction, delta)
	
	var fire_input := Input.is_action_pressed("wepon_fire")
	if(fire_input):
		weapon.fire()
	
	#Apply velocity to move
	


func _input(event: InputEvent):
	pass
