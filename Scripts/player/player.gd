extends KinematicBody2D
# The Player is a KinematicBody2D, in other words a physics-driven object.
# It can move, collide with the world, etc...
# The player has a state machine, but the body and the state machine are separate.

signal direction_changed(new_direction)

onready var animatedSprite: = $AnimatedSprite
onready var attackArea: = $AttackArea
onready var swordHitSound: = $SwordHitSound

var look_direction = Vector2.RIGHT setget set_look_direction


func set_look_direction(value):
    look_direction = value
    emit_signal("direction_changed", value)
    print(look_direction)
