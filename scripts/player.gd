extends CharacterBody2D

class_name Player

const MAX_SPEED = 250.0
const ACCELERATION = 1000.0
const FRICTION = 500.0
var current_direction = "idle"

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	match input:
		Vector2.LEFT, Vector2.RIGHT:
			current_direction = "face_horizontal"
			animated_sprite_2d.play("run_horizontal")
		Vector2.UP:
			current_direction = "face_up"
			animated_sprite_2d.play("run_up")
		Vector2.DOWN:
			current_direction = "face_down"
			animated_sprite_2d.play("run_down")
		_:
			# default is just standing still/idle. this sets input x and y values to 0 to stop 
			# use doing diagonal movement, this is very clunky and means you come to a immediate
			# stop which is a bit shit. probably need to remove the match statement and do something smarter
			input.x = 0
			input.y = 0
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			animated_sprite_2d.play(current_direction)
	
	velocity = velocity.move_toward(input * MAX_SPEED, ACCELERATION * delta)
	if input.x != 0: animated_sprite_2d.scale.x = sign(input.x)
	move_and_slide()
