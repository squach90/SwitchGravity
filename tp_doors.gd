extends Area2D

@export var destination = Vector2()
var countdown = 0.5
var isTP = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isTP:
		countdown -= delta
		$CanvasLayer.visible = true
		if countdown <= 0:
			$CanvasLayer.visible = false
			isTP = false
			countdown = 0.5
		


func _on_body_entered(body):
	if body.name == "Player":
		body.position = destination
		isTP = true
