extends Node
class_name InputCMP

var input_vector: Vector2i = Vector2i.ZERO

func _unhandled_key_input(event: InputEvent) -> void:
    if event.is_action_pressed("move_up"):
        input_vector = Vector2i(0, -1)
    if event.is_action_pressed("move_down"):
        input_vector = Vector2i(0, 1)
    if event.is_action_pressed("move_left"):
        input_vector = Vector2i(-1, 0)
    if event.is_action_pressed("move_right"):
        input_vector = Vector2i(1, 0)
    print(input_vector)

## Returns input vector along EITHER the horizontal or vertical axis
func get_input_vector() -> Vector2i:
    return input_vector

func reset_input_vector() -> void:
    input_vector = Vector2i.ZERO