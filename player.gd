extends CharacterBody2D


const SPEED = 400.0
var AnimationSprite
var jump_force = -400
var gravity_reversed = false
var facing_right = true 
var gravity_flip_count = 0
const MAX_GRAVITY_FLIPS = 2

var gravity = 3000
var reversed_speed = 6000
var konami_code = [
	KEY_UP, KEY_DOWN, KEY_UP, KEY_DOWN,
	KEY_LEFT, KEY_RIGHT, KEY_LEFT, KEY_RIGHT,
]
var konami_index = 0

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == konami_code[konami_index]:
			konami_index += 1
			if konami_index == len(konami_code):
				konami_index = 0
				# Code Konami complété, afficher un message dans la console
				print("Code Konami entré !")
				Global.codeKonamie = true
		else:
			konami_index = 0  


func _ready():
	AnimationSprite = $AnimatedSprite2D
	set_process_input(true)

func _physics_process(delta):
	
	Global.gravity_flip_count = self.gravity_flip_count
	Global.playerPosition = self.global_position
	
	if Global.newGame:
		self.global_position = Global.firstPlayerPosition
		Global.newGame = false
	
	if Global.isOnPlay:
	
		if Input.is_action_pressed("kill"):
			Global.lifeValue -= 1
		
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
		else:
			# Reset gravity flip count when touching the floor
			gravity_flip_count = 0
			
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
			
		if Input.is_action_just_pressed("space") and gravity_flip_count < MAX_GRAVITY_FLIPS:
			gravity_reversed = not gravity_reversed
			flip()
			gravity_flip_count += 1
		
		if gravity_reversed:
			velocity.y -= reversed_speed * get_process_delta_time()
			

		move_and_slide()

func flip():
	facing_right = not facing_right
	$AnimatedSprite2D.scale.y *= -1 


