extends KinematicBody2D

signal mob_freed

export var ACCELERATION = 300
export var MAX_SPEED = 50

var velocity = Vector2.ZERO

#func _ready():
#    SignalBus.connect("player_moved", self, "_on_player_moved")
#    player_pos = get_node("res://Scripts/player/player.gd").global_position

func _physics_process(delta):
    _accelerate_towards_point(Global.g_player_position, delta)
    velocity = move_and_slide(velocity)

func _accelerate_towards_point(point, delta):
#    print("Heart Position: ", global_position)
    var direction = global_position.direction_to(point)
    velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
    velocity = move_and_slide(velocity)
#    sprite.flip_h = velocity.x < 0

# Destroy Mob obj if exits screen
func _on_VisibilityNotifier2D_screen_exited():
    queue_free()
    SignalBus.emit_signal("mob_freed")

#func _on_player_moved(player_global_position):
#    player_pos = player_global_position
