extends CanvasLayer

var countdown = 1.1
var isGameOver = false
var portfolioLink = "https://portfolio-squach.vercel.app/"
var gameJamLink = "https://itch.io/jam/indie-park-game-jam"
var sourceCodeLink = "https://github.com/squach90/SwitchGravity"
var itchIoLink = "https://squach90.itch.io/"

var konami_code = [
	"ui_up", KEY_UP, KEY_DOWN, KEY_DOWN,
	"ui_left", KEY_RIGHT, KEY_LEFT, KEY_RIGHT,
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$inGame/gravityFlipRemaining.text = "Gravity Flip Remaining : " + str(Global.flips_remaining)
	$gameOverMenu/attemptsLabel.text = "Attempts : " + str(Global.attempts)
	if Global.codeKonamie:
		$easterEggPanel.visible = true
	
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
		#TODO: Void can kill Player


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


func _on_reset_data_button_pressed():
	Global.lifeValue = 1
	Global.isOnPlay = false
	Global.attempts = 0
	Global.coinsValue = 0


func _on_game_jam_link_pressed():
	OS.shell_open(gameJamLink)
	
	

func _on_source_code_pressed():
	OS.shell_open(sourceCodeLink)



func _on_portfolio_button_pressed():
	OS.shell_open(portfolioLink)


func _on_itch_button_pressed():
	OS.shell_open(itchIoLink)


func _on_close_button_pressed():
	$optionPanel.visible = false
	$mainMenu.visible = true


func _on_option_button_pressed():
	$optionPanel.visible = true


func _on_quit_button_pressed():
	get_tree().quit()



func _on_close_easter_egg_button_pressed():
	Global.codeKonamie = false
	$easterEggPanel.visible = false
