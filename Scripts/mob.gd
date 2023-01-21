extends KinematicBody2D

signal mob_freed

const EnemyDeathEffect = preload("res://Scenes/EnemyDeathEffect.tscn")

export var ACCELERATION = 300
export var MAX_SPEED = 50

var velocity = Vector2.ZERO

#func _ready():
#    print("I'm ready")

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
#    SignalBus.emit_signal("mob_freed")

func _on_Hurtbox_area_entered(area):
    queue_free()
    var enemyDeathEffect = EnemyDeathEffect.instance()
    get_parent().add_child(enemyDeathEffect)
    enemyDeathEffect.global_position = global_position
    SignalBus.emit_signal("mob_freed")
#    SignalBus.emit_signal("mob_sword_kill", global_position)
    
