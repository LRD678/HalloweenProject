extends Node2D

@onready var collectable = preload("res://Scenes/Collectable.tscn")
@onready var score_label : Label = $HUD/UI/ScoreLabel
@onready var time_label : Label = $HUD/UI/TimeLabel

var score = 0

func _process(delta):
	time_label.text = str(round($GameTimer.time_left)) + " Sec"

func _on_timer_timeout():
	var col_inst = collectable.instantiate()
	add_child(col_inst)
	col_inst.global_position = Vector2(randi_range(14, 303), 14)
	
func add_score(points : int):
	score += points
	score_label.text = str(score) + " Candy"

func _on_ground_hitbox_body_entered(body):
	if body.is_in_group("Candy"):
		body.queue_free()

func _on_game_timer_timeout():
	print(score)
	get_tree().paused = true
