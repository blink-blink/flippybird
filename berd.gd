extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 6

signal death

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity()*2 * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	
	if position.y <= -2.0 or get_last_slide_collision():
		queue_free()
		emit_signal("death")
