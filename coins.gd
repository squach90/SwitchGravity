extends Area2D

@export var number = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(body):
	if body.name == "Player":
		Global.coinsValue += number
		print("Piece collected: ", self.name)
		#TODO: Add Sound
		queue_free()
