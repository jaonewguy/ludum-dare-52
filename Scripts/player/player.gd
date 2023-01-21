extends KinematicBody2D
# The Player is a KinematicBody2D, in other words a physics-driven object.
# It can move, collide with the world, etc...
# The player has a state machine, but the body and the state machine are separate.

signal direction_changed(new_direction)

onready var animatedSprite: = $AnimatedSprite
onready var attackArea: = $HitboxPivot
onready var swordHitSound: = $SwordHitSound

var look_direction = Vector2.RIGHT setget set_look_direction

func _ready():
    Global.g_player_position = self.global_position
#    SignalBus.connect("mob_sword_kill", self, "_on_mob_sword_kill")

func set_look_direction(value):
    look_direction = value
    emit_signal("direction_changed", value)

#func _on_mob_sword_kill(mob_position):
#    self.global_position.x = mob_position.x
