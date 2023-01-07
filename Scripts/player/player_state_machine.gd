extends "res://Scripts/state_machine/state_machine.gd"

onready var idle = $Idle
onready var move = $Move
onready var jump = $Jump
onready var stagger = $Stagger
onready var slashAttack = $SlashAttack

func _ready():
    states_map = {
        "idle": idle,
        "move": move,
        "jump": jump,
        "stagger": stagger,
        "slashAttack": slashAttack,
    }
    
    # TODO: Find a way to refactor
    get_node("../AttackArea/AttackAreaCollision").disabled = true
    get_node("../AttackArea/AttackAreaCollision").visible = false


func _change_state(state_name):
    # The base state_machine interface this node extends does most of the work.
    if not _active:
        return
#    if state_name in ["stagger", "jump", "slashAttack"]:
#        states_stack.push_front(states_map[state_name])
    if state_name == "jump" and current_state == move:
        jump.initialize(move.speed, move.velocity)
    ._change_state(state_name)


func _unhandled_input(event):
    # Here we only handle input that can interrupt states, slashAttacking in this case,
    # otherwise we let the state node handle it.
    if event.is_action_pressed("slashAttack"):
        if current_state in [slashAttack, stagger]:
            return
        _change_state("slashAttack")
        return
    current_state.handle_input(event)


func _on_AnimatedSprite_animation_finished():
    ._on_animation_finished(owner.animatedSprite.animation) # TODO: This seems horrible compared to AnimationPlayer, have to grab member var from parent, or grab $AnimatedSprite directly from Tree.
