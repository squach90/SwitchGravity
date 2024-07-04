extends CharacterBody2D


const SPEED = 400.0
var AnimationSprite
var jump_force = -400
var gravity_reversed = false
var facing_right = true 

var gravity = 3000
var reversed_speed = 6000

func _ready():
	AnimationSprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if abs(velocity.x) > 0:
		AnimationSprite.play("run")
		if velocity.x < 0:
			AnimationSprite.scale.x = -1
		elif velocity.x > 0:
			AnimationSprite.scale.x = 1
	else:
		AnimationSprite.stop()
		
	if Input.is_action_just_pressed("space"):
		gravity_reversed = not gravity_reversed
		flip()
	
	if gravity_reversed:
		velocity.y -= reversed_speed * get_process_delta_time()

	move_and_slide()

func flip():
	facing_right = not facing_right
	$AnimatedSprite2D.scale.y *= -1 
