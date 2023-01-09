extends Node


#func game_over():
#    $ScoreTimer.stop()
#    $MobTimer.stop()
#    $HUD.show_game_over()
#    $DeathSound.play()
#    $Music.stop()

func _ready():
    get_tree().paused = true

func new_game():
    get_tree().paused = false
#    score = 0
#    $Player.start($StartPosition.position)
    $GameTimer.start()
#    $HUD.update_score(score)
    $HUD.show_message("Get Ready")
#    get_tree().call_group("mobs", "queue_free")
    $BGM.play()
