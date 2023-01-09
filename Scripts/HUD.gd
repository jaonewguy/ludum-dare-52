extends CanvasLayer

signal start_game

var instructions_text

func _ready():
    instructions_text = $Docs.text

func show_message(text):
    $Docs.text = text
    $Docs.show()
    $MessageTimer.start()

func show_game_over():
    show_message("Game Over")
    yield($MessageTimer, "timeout")
    $Docs.text = instructions_text
    $Docs.show()
    yield(get_tree().create_timer(1), 'timeout')
    $StartButton.show()

func update_score(score):
    $ScoreLabel.text = str(score)

func _on_StartButton_pressed():
    $StartButton.hide()
    emit_signal("start_game")


func _on_MessageTimer_timeout():
    $Docs.hide()
