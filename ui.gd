extends CanvasLayer

var countdown = 1.1
var isGameOver = false

#TODO: Link all button in Option Panel and link the "Option" button on the menu screen ot the panel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$gameOverMenu/attemptsLabel.text = "Attempts : " + str(Global.attempts)
	
	if not isGameOver:
		$inGame/coinLabel.text = str(Global.coinsValue)
		if Global.lifeValue <= 0:
			isGameOver = true
			$inGame/lifeTexture.visible = false
			countdown -= delta
			$animation.visible = true
			$animation/AnimationPlayer.play("fondu")
			if countdown <= 0:
				$animation.visible = false
				$inGame.visible = false
				$gameOverMenu.visible = true
		else :
			$inGame/lifeTexture.visible = true
			
	else:
		# If game is over, reduce the countdown and show game over menu after animation
		countdown -= delta
		if countdown <= 0 and not $gameOverMenu.visible:
			$animation.visible = false
			$inGame.visible = false
			$gameOverMenu.visible = true
		#TODO: Void can kill Player and Maybe Monsters


func _on_play_button_pressed():
	$animation.visible = true
	$animation/AnimationPlayer.play("fondu2")
	$mainMenu.visible = false
	$inGame.visible = true
	Global.isOnPlay = true
	Global.lifeValue = 1
	Global.coinsValue = 0
	Global.newGame = true
	Global.attempts += 1


func _on_return_button_pressed():
	
	$gameOverMenu.visible = false
	$mainMenu.visible = true
	Global.lifeValue = 1  # Réinitialiser la vie du joueur
	countdown = 1.1  # Réinitialiser le compte à rebours
	isGameOver = false
