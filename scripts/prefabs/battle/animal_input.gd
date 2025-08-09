extends Node
class_name BattleAnimalInput

var deciding: bool = false
var decision: int = 0

## Decide between action 1 and 2
func decide_action() -> void:
    # TODO: Override
    pass

func get_decision() -> int:
    var res = decision
    if decision > 0:
        decision = 0
        deciding = false
    return res