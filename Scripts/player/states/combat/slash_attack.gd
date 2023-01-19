extends "res://Scripts/state_machine/state.gd"


func enter():
    owner.animatedSprite.animation = "slash_attack"
    
    # TODO: Find a way to refactor. Original attempt left player with weird floating bug.
    get_node("../../HitboxPivot/AttackAreaDetect/AttackAreaCollision").disabled = false
    get_node("../../HitboxPivot/AttackAreaDetect/AttackAreaCollision").visible = true
#    get_node("../../HitboxPivot/AttackAreaDetect/AttackAreaCollision").monitoring = true


func _on_animation_finished(_name):
    emit_signal("finished", "idle") # TODO: Idle instead of previous, if no stack
    # TODO: Find a way to refactor. Original attempt left player with weird floating bug.
    get_node("../../HitboxPivot/AttackAreaDetect/AttackAreaCollision").disabled = true
    get_node("../../HitboxPivot/AttackAreaDetect/AttackAreaCollision").visible = false
#    get_node("../../HitboxPivot/AttackAreaDetect/AttackAreaCollision").monitoring = false
    


func _on_AttackAreaDetect_body_entered(body):
#    print("Attack detected")
    owner.swordHitSound.play()
