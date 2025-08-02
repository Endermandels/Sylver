extends CharacterBody2D
class_name Player

@export_group("Internal Nodes")
@export var input_cmp: InputCMP
@export var waypoint_finder_cmp: WaypointFinderCMP
@export var movement_cmp: MovementCMP

@export_group("External Nodes")
@export var waypoints: Node2D

var current_waypoint: Waypoint = null

func _ready() -> void:
    _get_current_waypoint()

func _process(delta: float) -> void:
    if not current_waypoint:
        return

    # Go to nearest waypoint indicated by input, or stay
    var closest_waypoint = waypoint_finder_cmp.get_closest_waypoint(current_waypoint, waypoints, input_cmp.get_input_vector())
    
    # Upon arriving at closest waypoint, set it to be the current waypoint
    if movement_cmp.go_to_point(self, closest_waypoint, delta):
        current_waypoint = closest_waypoint
        input_cmp.reset_input_vector()

    move_and_slide()

func _get_current_waypoint() -> void:
    for wp: Waypoint in waypoints.get_children():
        if wp.global_position == global_position:
            current_waypoint = wp
    if not current_waypoint:    
        push_error("Current waypoint not found (make sure Player is on a waypoint at start of game)")
        get_tree().quit()
