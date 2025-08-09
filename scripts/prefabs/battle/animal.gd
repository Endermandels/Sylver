extends Node2D
class_name BattleAnimal

@export_group("Settings")
@export var is_enemy: bool = true

@export_group("External Nodes")
@export var battle_animal_input: BattleAnimalInput

@export_group("Internal Nodes")
@export var stats: BattleStats
@export var sprite: Sprite2D

signal turn_ended()

func _ready() -> void:
	if is_enemy:
		sprite.flip_h = true

## Start deciding which action to choose
func choose_action() -> void:
	battle_animal_input.decide_action()

## Perform Action 1, then call `_end_turn`
func _action_1() -> void:
	# TODO: Override
	pass

## Perform Action 2, then call `_end_turn`
func _action_2() -> void:
	# TODO: Override
	pass

## Wait for Animal to make decision
func _process(_delta: float) -> void:
	if battle_animal_input.deciding:
		var decision: int = battle_animal_input.get_decision()
		if decision > 0:
			if (decision == 1):
				_action_1()
			elif (decision == 2):
				_action_2()
			else:
				push_error("Unknown Input Action: " + str(decision))
				get_tree().quit()

## Activate any applied effects like burn or poison, then end turn
func _end_turn() -> void:
	# TODO: Activate effects
	turn_ended.emit()
