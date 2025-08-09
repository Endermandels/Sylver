extends Node
class_name BattleLogic

@export_group("External Nodes")
@export var animals: Node2D
@export var screen_transition: ScreenTransition

var turn_queue: Array[BattleAnimal] = []
var turn_idx: int = 0

func _ready() -> void:
    # Populate queue from highest speed to lowest speed
    for pp: BattleAnimal in animals.get_children():
        pp.turn_ended.connect(_on_animal_turn_ended)
        var idx = 0
        for tt: BattleAnimal in turn_queue:
            if pp.stats.spd > tt.stats.spd:
                break
            idx += 1
        turn_queue.insert(idx, pp)
    screen_transition.faded_from_black.connect(turn_queue[turn_idx].choose_action)

func _on_animal_turn_ended():
    turn_idx += 1
    if turn_idx >= turn_queue.size():
        turn_idx = 0
    turn_queue[turn_idx].choose_action()
