extends Node2D
class_name ScreenTransition

@export_group("Settings")
@export var time_fade_to_black: float = 1.0
@export var time_fade_from_black: float = 1.0
@export_subgroup("On Ready")
@export var fade_to_black_on_ready: bool
@export var fade_from_black_on_ready: bool

@export_group("Internal Nodes")
@export var color_rect: ColorRect

signal faded_to_black()
signal faded_from_black()

func _ready() -> void:
    if (fade_to_black_on_ready):
        fade_to_black()
    elif (fade_from_black_on_ready):
        fade_from_black()

func fade_to_black() -> void:
    show()
    color_rect.modulate.a = 0.0
    var tween = get_tree().create_tween()
    tween.tween_property(color_rect, "modulate:a", 1.0, time_fade_to_black)
    tween.finished.connect(faded_to_black.emit)

func fade_from_black() -> void:
    show()
    color_rect.modulate.a = 1.0
    var tween = get_tree().create_tween()
    tween.tween_property(color_rect, "modulate:a", 0.0, time_fade_from_black)
    tween.finished.connect(faded_from_black.emit)
