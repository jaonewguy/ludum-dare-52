# From: https://kidscancode.org/godot_recipes/3.x/physics/conveyor_belt/

extends StaticBody2D

export var speed = 50

func _ready():
    constant_linear_velocity.x = speed

func _process(delta):
    $Sprite.texture.region.position.x -= speed * delta
