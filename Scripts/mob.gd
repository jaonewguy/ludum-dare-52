extends RigidBody2D

# Destroy Mob obj if exits screen
func _on_VisibilityNotifier2D_screen_exited():
    queue_free()
