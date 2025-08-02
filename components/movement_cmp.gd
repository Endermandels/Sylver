extends Node
class_name MovementCMP

@export_group("Settings")
@export var speed: float = 500

## Return whether body has arrived at point
func go_to_point(body: CharacterBody2D, point: Node2D, delta: float) -> bool:
    if body.global_position == point.global_position:
        return true
    body.global_position = body.global_position.move_toward(point.global_position, speed * delta)
    if body.global_position == point.global_position:
        return true
    return false