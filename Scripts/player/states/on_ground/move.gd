extends "on_ground.gd"

export(int) var MAX_WALK_SPEED = 175
export(int) var MAX_RUN_SPEED = 300

func enter():
    speed = MAX_WALK_SPEED
    velocity = Vector2()

    var input_direction = get_input_direction()
    update_look_direction(input_direction)
    owner.animatedSprite.animation = "move"


func handle_input(event):
    return .handle_input(event)


func update(_delta):
    var input_direction = get_input_direction()
    if not input_direction:
        emit_signal("finished", "idle")
    update_look_direction(input_direction)

    if Input.is_action_pressed("run"):
        speed = MAX_RUN_SPEED
        owner.animatedSprite.speed_scale = 3.0
    else:
        speed = MAX_WALK_SPEED
        owner.animatedSprite.speed_scale = 1.0

    move(_delta, speed, input_direction)


func move(_delta, speed, direction):
    velocity = direction.normalized() * speed
#    owner.move_and_slide(velocity, Vector2(), 5, 2, 0.785398, false)
    owner.move_and_collide(velocity * _delta, false)
#    Global.g_player_position = owner.global_position
#    SignalBus.emit_signal("player_moved", owner.global_position)
