extends StaticBody2D
#
#
## This represents the player's inertia.
#export (int, 0, 200) var push = 100
#
#var velocity = Vector2.ZERO
#
#func _physics_process(delta):
#
#    move_and_collide(velocity, false)
#    # after calling move_and_slide()
##    for index in get_slide_count():
##        var collision = get_slide_collision(index)
##        if collision.collider.is_in_group("bodies"):
##            collision.collider.apply_central_impulse(-collision.normal * push)
