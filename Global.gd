extends Node

var coinsValue = 0
var lifeValue = 1
var isOnPlay = false
var playerPosition = null
var firstPlayerPosition = Vector2(-1, 37)
var newGame = false
var attempts = 0
var codeKonamie = false
var maxGravityFlip = 2
var gravity_flip_count = 0
var flips_remaining = maxGravityFlip - gravity_flip_count

var finish = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	flips_remaining = maxGravityFlip - gravity_flip_count
