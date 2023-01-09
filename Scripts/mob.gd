extends RigidBody2D

signal mob_freed

# Destroy Mob obj if exits screen
func _on_VisibilityNotifier2D_screen_exited():
    queue_free()
    SignalBus.emit_signal("mob_freed")
