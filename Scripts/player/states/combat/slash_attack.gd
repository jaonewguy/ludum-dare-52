extends "res://Scripts/state_machine/state.gd"

func enter():
    owner.animatedSprite.animation = "slash_attack"


func _on_animation_finished(_name):
    emit_signal("finished", "idle") # TODO: Idle instead of previous, if no pushdown
    
