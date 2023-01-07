extends Node

export(PackedScene) var mob_scene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    $MobTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_MobTimer_timeout():
    # Create a new instance of the Mob scene.
    var mob = mob_scene.instance()
    mob.position = get_node("MobSpawner").position

    # Spawn the mob by adding it to the Main scene.
    add_child(mob)
