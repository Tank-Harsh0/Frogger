extends Node2D

var carscene : PackedScene = preload("res://scenes/car.tscn")
var score: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#the screen changing function
func change_screen():
	if (score != 0 and score > 0):
		Global.score = score
	get_tree().change_scene_to_file("res://scenes/title.tscn")

#Spawning the cars
func _on_cartimer_timeout() -> void:
	var car = carscene.instantiate() as Area2D
	var pos_marker = $CarStartingPoints.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect('body_entered',go_to_title)
	
#Player hit by a car
func go_to_title(_body) -> void:
	call_deferred('change_screen')
	
#player Finish the game
func _on_finish_line_body_entered(_body: Node2D) -> void:
	call_deferred('change_screen')

# Updating the scores
func _on_score_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = 'Time elapsed: ' + str(score)
