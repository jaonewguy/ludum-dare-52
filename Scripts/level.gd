extends Node

export(PackedScene) var mob_scene

onready var conveyor: = $Conveyor
onready var player_position = $Player

func _ready():
    $MobTimer.start()

func _on_MobTimer_timeout():
    # Create a new instance of the Mob scene.
    var mob_left = mob_scene.instance()
    mob_left.position = get_node("MobSpawnLeft").position

    # Spawn the mob by adding it to the Main scene.
    add_child(mob_left)
    SignalBus.emit_signal("mob_spawned")

func increase_difficulty():
    $MobTimer.wait_time *= 0.75
