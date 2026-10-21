extends CharacterBody2D
class_name Player

@export var state_machine: StateMachine
@export var move_component: Node
@export var jump_component: Node
@export var visual_component: Node

func _unhandled_input(event: InputEvent) -> void:
	state_machine.on_handle_input(event)

func _process(delta: float) -> void:
	state_machine.on_update(delta)

func _physics_process(delta: float) -> void:
	state_machine.on_physics_update(delta)
