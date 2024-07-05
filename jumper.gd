extends Area2D

@export var reverse = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.play("jump")
		if reverse:
			body.velocity.y += 1700
		else:
			body.velocity.y += -1700
