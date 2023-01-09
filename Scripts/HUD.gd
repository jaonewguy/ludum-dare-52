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

func update_score(score):
    $Score.text = str(score)

func update_mob_count(mob_count):
    $MobCount.text = str(mob_count)

func _on_StartButton_pressed():
    $StartButton.hide()
    emit_signal("start_game")

func _on_MessageTimer_timeout():
    $Docs.hide()
