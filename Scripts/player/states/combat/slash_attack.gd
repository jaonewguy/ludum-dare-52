extends "res://Scripts/state_machine/state.gd"

#var isAttacking = false

func enter():
    get_node("../../AttackArea/AttackAreaCollision").disabled = false
    get_node("../../AttackArea/AttackAreaCollision").visible = true
    owner.animatedSprite.animation = "slash_attack"
#    isAttacking = true


func _on_animation_finished(_name):
#    isAttacking = false
    emit_signal("finished", "idle") # TODO: Idle instead of previous, if no pushdown
    get_node("../../AttackArea/AttackAreaCollision").disabled = true
    get_node("../../AttackArea/AttackAreaCollision").visible = false
    
