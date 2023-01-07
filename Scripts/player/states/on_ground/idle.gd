extends "on_ground.gd"

func enter():
    if owner.animatedSprite: # TODO: Find out why this is null in AnimatedSprite vs AnimationPlayer
        owner.animatedSprite.animation = "idle"


func handle_input(event):
    return .handle_input(event)


func update(_delta):
    var input_direction = get_input_direction()
    if input_direction:
        emit_signal("finished", "move")
