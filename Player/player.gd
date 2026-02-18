extends CharacterBody2D

const SPEED = 80

var current_direction

enum{
	UP,
	UP_RIGHT,
	UP_LEFT,
	DOWN,
	DOWN_RIGHT,
	DOWN_LEFT,
	LEFT,
	RIGHT,
	IDLE
}

var KEY_UP = false
var KEY_DOWN = false
var KEY_RIGHT = false
var KEY_LEFT = false

func _process(delta: float) -> void:
	pass

func input_in_action():
	read_input(KEY_UP, "move_up")
	read_input(KEY_DOWN, "move_down")
	read_input(KEY_RIGHT, "move_right")
	read_input(KEY_LEFT, "move_left")

func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)

func read_input(KEY: bool, action: StringName):
	if Input.is_action_pressed(action): return true
	else: return false
