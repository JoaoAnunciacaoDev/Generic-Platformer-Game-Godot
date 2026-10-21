extends Node
class_name StateMachine

@export var player: Player
@export var initial_state: State

var previous_state: State
var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.player = player
			child.state_machine = self
	
	if initial_state:
		current_state = initial_state
		current_state.on_state_enter()
	else:
		push_warning("Initial State not configured.")

func on_handle_input(event: InputEvent) -> void:
	var new_state: State = current_state.on_handle_input(event)
	if new_state: _transition_to(new_state)

func on_update(delta: float) -> void:
	var new_state: State = current_state.on_state_update(delta)
	if new_state: _transition_to(new_state)

func on_physics_update(delta: float) -> void:
	var new_state: State = current_state.on_state_physics_update(delta)
	if new_state: _transition_to(new_state)

func _transition_to(new_state: State) -> void:
	if current_state: current_state.on_state_exit()
	
	previous_state = current_state
	current_state = new_state
	current_state.on_state_enter()
