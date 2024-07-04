extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$inGame/coinLabel.text = str(Global.coinsValue)
	if Global.lifeValue <= 0:
		$inGame/lifeTexture.visible = false
		#TODO: Link this to a GameOver Screen (and create it)
		#TODO: Void can kill Player and Maybe Monsters
