extends "res://Scripts/state_machine/state.gd"
# Collection of important methods to handle direction and animation.

# func handle_input(event):
#     if event.is_action_pressed("simulate_damage"):
#         emit_signal("finished", "stagger")


func get_input_direction():
    return Vector2(
            Input.get_axis("move_left", "move_right"),
            0
    )


func update_look_direction(direction):
    if direction and owner.look_direction != direction:
        owner.look_direction = direction
        owner.animatedSprite.flip_h = direction.x < 0 # TODO: Sprite starts right, hard-coded to work to flip left and vice-versa
        owner.attackArea.scale.x *= -1
