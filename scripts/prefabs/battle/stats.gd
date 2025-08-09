extends Node
class_name BattleStats

@export_group("Stats")
@export var max_hp: int = 0
@export var atk: int = 0
@export var spd: int = 0

@onready var hp = max_hp

func is_dead() -> bool:
    return hp < 1