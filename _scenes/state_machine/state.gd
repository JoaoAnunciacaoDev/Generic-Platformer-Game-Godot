extends Node
class_name State

var player: Player
var state_machine: StateMachine

func on_state_enter() -> void:
	pass

func on_state_exit() -> void:
	pass

func on_handle_input(_event: InputEvent) -> State:
	return null

func on_state_update(_delta: float) -> State:
	return null

func on_state_physics_update(_delta: float) -> State:
	return null
