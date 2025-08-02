extends Node
class_name WaypointFinderCMP

func get_closest_waypoint(current_waypoint: Waypoint, waypoints: Node2D, input_vector: Vector2i) -> Waypoint:
    if input_vector == Vector2i.ZERO:
        return current_waypoint
    
    var closest_waypoint: Waypoint = null
    var horizontal: bool = input_vector.y == 0

    for wp: Waypoint in waypoints.get_children():
        if wp == current_waypoint:
            continue

        # Make sure waypoint aligns with current waypoint
        if horizontal and wp.global_position.y != current_waypoint.global_position.y \
                or not horizontal and wp.global_position.x != current_waypoint.global_position.x:
            continue
        
        # Make sure waypoint is in the correct direction
        if input_vector.x < 0 and (wp.global_position.x >= current_waypoint.global_position.x or current_waypoint.blocked_left) \
            or input_vector.x > 0 and (wp.global_position.x <= current_waypoint.global_position.x or current_waypoint.blocked_right) \
            or input_vector.y < 0 and (wp.global_position.y >= current_waypoint.global_position.y or current_waypoint.blocked_up) \
            or input_vector.y > 0 and (wp.global_position.y <= current_waypoint.global_position.y or current_waypoint.blocked_down):
            continue
        
        if not closest_waypoint:
            closest_waypoint = wp
            continue

        var diff_new: Vector2 = (wp.global_position - current_waypoint.global_position)
        var diff_old: Vector2 = (closest_waypoint.global_position - current_waypoint.global_position)
        
        # Check that the new distance is shorter than the shortest distance
        if diff_new.length() < diff_old.length():
            closest_waypoint = wp
    
    return closest_waypoint if closest_waypoint else current_waypoint
