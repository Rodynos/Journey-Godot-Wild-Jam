extends CharacterBody2D

const SPEED = 80

var current_direction

enum direction{
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
	set_input()
	set_direction()
	move()

func set_input():
	read_input(KEY_UP, "move_up")
	read_input(KEY_DOWN, "move_down")
	read_input(KEY_RIGHT, "move_right")
	read_input(KEY_LEFT, "move_left")


func set_direction():
	if KEY_UP:
		if KEY_LEFT:
			current_direction = direction.UP_LEFT
		elif KEY_RIGHT: 
			current_direction = direction.UP_RIGHT
		else: current_direction = direction.UP
	elif KEY_DOWN:
		if KEY_LEFT:
			current_direction = direction.DOWN_LEFT
		elif KEY_RIGHT: 
			current_direction = direction.DOWN_RIGHT
		else: current_direction = direction.DOWN
	elif KEY_LEFT:
		current_direction = direction.LEFT
	elif KEY_RIGHT:
		current_direction = direction.RIGHT
	else: current_direction - direction.IDLE


func move():
	match current_direction:
		direction.UP:
			self.velocity = Vector2(0, -SPEED)
			# $AnimatedSprite2D.play("up")
		direction.UP_RIGHT:
			self.velocity = cartesian_to_isometric(Vector2(0, -SPEED))
			# $AnimatedSprite2D.play("up_right")
		direction.UP_LEFT:
			self.velocity = cartesian_to_isometric(Vector2(-SPEED, 0))
			# $AnimatedSprite2D.play("up_left")
		direction.DOWN:
			self.velocity = Vector2(0, SPEED)
			# $AnimatedSprite2D.play("down")
		direction.DOWN_RIGHT:
			self.velocity = cartesian_to_isometric(Vector2(SPEED, 0))
			# $AnimatedSprite2D.play("down_right")
		direction.DOWN_LEFT:
			self.velocity = cartesian_to_isometric(Vector2(0, SPEED))
			# $AnimatedSprite2D.play("down_right")
		direction.LEFT:
			self.velocity = Vector2(-SPEED, 0)
			# $AnimatedSprite2D.play("left")
		direction.RIGHT:
			self.velocity = Vector2(SPEED, 0)
			# $AnimatedSprite2D.play("right")
		direction.IDLE:
			self.velocity = Vector2(0, 0)
			# $AnimatedSprite2D.play("idle")
		
	move_and_slide()


func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)


func read_input(KEY: bool, action: StringName):
	if Input.is_action_pressed(action): return true
	else: return false
