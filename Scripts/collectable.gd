extends RigidBody2D

@export var speed : int = 10000

func _ready():
	randomize()
	apply_central_force(Vector2(randi_range(speed, -speed), randi_range(speed, -speed)))

func is_detected():
	self.queue_free()
	get_parent().add_score(1)
