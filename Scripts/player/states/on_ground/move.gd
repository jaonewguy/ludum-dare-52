extends "on_ground.gd"

export(int) var MAX_WALK_SPEED = 100
export(int) var MAX_RUN_SPEED = 175

func enter():
    speed = MAX_RUN_SPEED
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

#    if Input.is_action_pressed("run"):
#        speed = MAX_RUN_SPEED
#    else:
#        speed = MAX_WALK_SPEED

    var collision_info = move(speed, input_direction)
    if not collision_info:
        return
#    if speed == MAX_RUN_SPEED and collision_info.collider.is_in_group("environment"):
#        return null


func move(speed, direction):
    velocity = direction.normalized() * speed
    owner.move_and_slide(velocity, Vector2(), 5, 2)
    if owner.get_slide_count() == 0:
        return
    return owner.get_slide_collision(0)