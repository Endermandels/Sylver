extends Node
class_name AnimationCMP

@export_group("External Nodes")
@export var sprite: Sprite2D

func handle_animation(input_vector) -> void:
    if input_vector.x < 0:
        sprite.frame = 0
        sprite.flip_h = true
    if input_vector.x > 0:
        sprite.frame = 0
        sprite.flip_h = false
    if input_vector.y > 0:
        sprite.frame = 1
    if input_vector.y < 0:
        sprite.frame = 2