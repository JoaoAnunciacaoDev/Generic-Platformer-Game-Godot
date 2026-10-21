extends Node
class_name JumpComponent

@export var player: Player

@export_category("Pulo")
@export var jump_force: float = 14.0
@export var jump_cut_multiplier: float = 0.5

@export_category("Game Feel")
@export var coyote_time: float = 0.12
@export var jump_buffer_time: float = 0.18

@export_category("Wall Jump")
@export var wall_jump_force_y: float = 22.0
@export var wall_leap_force_x: float = 14.0
@export var wall_climb_force_x: float = 4.0
@export var wall_coyote_time: float = 0.15

@export_category("Slide Jump")
@export var slide_jump_speed_x: float = 16.0
@export var slide_jump_speed_y: float = 20.0

var _wall_coyote_timer: float
var _jump_buffer_timer
var _last_jump_direction_x: float
var _last_wall_direction: int

var can_wall_jump: bool:
	get:
		return (_wall_coyote_timer > 0.0 and jump_buffer_time > 0.0)
var has_buffered_jump: bool:
	get:
		return jump_buffer_time

func _process(delta: float) -> void:
	decrease_jump_buffer(delta)

func start_jump_buffer() -> void:
	_jump_buffer_timer = jump_buffer_time

func decrease_jump_buffer(delta: float) -> void:
	_jump_buffer_timer -= delta
