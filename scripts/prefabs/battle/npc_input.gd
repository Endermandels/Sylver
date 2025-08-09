extends BattleAnimalInput
class_name BattleNPCInput

## Decide between action 1 and 2
func decide_action() -> void:
    deciding = true
    get_tree().create_timer(2.0).timeout.connect(_set_decision)
    
func _set_decision():
    decision = randi_range(1, 2)