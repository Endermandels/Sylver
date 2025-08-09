extends Node
class_name InputCMP

var input_vector: Vector2i = Vector2i.ZERO
var input_buffer: Vector2i = Vector2i.ZERO
var interact: bool = false

func _unhandled_key_input(event: InputEvent) -> void:
    # For now, don't allow changing directions mid travel (too much of a hassle)
    if event.is_action_pressed("move_up"):
        input_buffer = Vector2i(0, -1)
    if event.is_action_pressed("move_down"):
        input_buffer = Vector2i(0, 1)
    if event.is_action_pressed("move_left"):
        input_buffer = Vector2i(-1, 0)
    if event.is_action_pressed("move_right"):
        input_buffer = Vector2i(1, 0)
    if event.is_action_pressed("interact") && input_buffer == Vector2i.ZERO && input_vector == Vector2i.ZERO:
        interact = true

func _process(_delta: float) -> void:
    if input_vector == Vector2i.ZERO:
        input_vector = input_buffer
        input_buffer = Vector2i.ZERO

## Returns input vector along EITHER the horizontal or vertical axis
func get_input_vector() -> Vector2i:
    return input_vector

func reset_input_vector() -> void:
    input_vector = Vector2i.ZERO

func get_interact() -> bool:
    var res = interact
    interact = false
    return res