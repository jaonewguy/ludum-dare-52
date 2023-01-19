extends Node

export(PackedScene) var mob_scene

onready var conveyor: = $Conveyor
onready var player_position = $Player

func _ready():
    $MobTimer.start()

func _on_MobTimer_timeout():
    # Create a new instance of the Mob scene.
    var mob_left = mob_scene.instance()
    var mob_right = mob_scene.instance()
    mob_left.position = get_node("MobSpawnLeft").position
    mob_right.position = get_node("MobSpawnRight").position

    # Spawn the mob by adding it to the Main scene.
    add_child(mob_left)
    add_child(mob_right)
    SignalBus.emit_signal("mob_spawned")
    SignalBus.emit_signal("mob_spawned")

func increase_difficulty():
    $MobTimer.wait_time *= 0.75
