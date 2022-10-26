extends CharacterBody2D

@export var speed : int = 300

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	global_position.y = 152

	move_and_slide()

func _on_hitbox_body_entered(body):
	if body.is_in_group("Candy"):
		body.is_detected()
