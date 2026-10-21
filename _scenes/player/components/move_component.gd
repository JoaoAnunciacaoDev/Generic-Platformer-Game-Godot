extends Node
class_name MoveComponent

@export var player: Player

@export_category("Velocidade")
@export var move_speed: float = 10.0

@export_category("Controle no Chão")
@export var ground_accel: float = 75.0
@export var ground_deccel: float = 95.0

@export_category("Controle no Ar")
@export var air_accel: float = 50.0
@export var air_deccel: float = 18.0

func move_horizontal(delta: float, input_axis: float, in_air: bool = false) -> void:
	var target_velocity_x: float = input_axis * move_speed
	
	if (
		in_air and abs(player.velocity.x) > move_speed
		and sign(player.velocity.x) == sign(input_axis)
		):
			
			player.velocity.x = move_toward(
				player.velocity.x, 
				target_velocity_x,
				air_deccel * delta)
			
			return
	
	var rate: float
	
	if in_air:
		rate = air_accel if abs(input_axis > 0.01) else air_deccel
	else:
		rate = ground_accel if abs(input_axis > 0.01) else ground_deccel
	
	player.velocity.x = move_toward(
		player.velocity.x, 
		target_velocity_x, 
		rate * delta)

func stop_horizontal(delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0.0, ground_deccel * delta)
