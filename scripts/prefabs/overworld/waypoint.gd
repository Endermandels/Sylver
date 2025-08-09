extends Node2D
class_name Waypoint

@export_group("Settings")

## Cannot move up from here
@export var blocked_up: bool = false

## Cannot move down from here
@export var blocked_down: bool = false

## Cannot move left from here
@export var blocked_left: bool = false

## Cannot move right from here
@export var blocked_right: bool = false

## Whether the current waypoint is interactable
@export var is_interactable: bool = false

## The scene to transition to when interacted
@export_file("*.tscn") var interaction_scene: String
