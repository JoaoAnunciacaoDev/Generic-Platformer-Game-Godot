extends State
class_name IdleState

func on_state_enter() -> void:
	player.visual_component.play_animation("idle")

func on_handle_input(event: InputEvent) -> State:
	if event.is_action_pressed("jump"):
		player.jump_component.start_jump_buffer()
	
	return null

func on_state_physics_update(delta: float) -> State:
	var input_axis: float = Input.get_axis("left", "right")
	player.move_component.stop_horizontal(delta)
	
	if player.jump_component.can_jump():
		return state_machine.states["jump"]
	
	if input_axis != 0 and player.is_on_floor():
		return state_machine.states["walk"]
	
	if player.velocity.y > 0:
		return state_machine.states["fall"]
	
	return null
