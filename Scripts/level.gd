extends Node

export(PackedScene) var mob_scene

func _ready():
    $MobTimer.start()

func _on_MobTimer_timeout():
    # Create a new instance of the Mob scene.
    var mob = mob_scene.instance()
    mob.position = get_node("MobSpawner").position

    # Spawn the mob by adding it to the Main scene.
    add_child(mob)
