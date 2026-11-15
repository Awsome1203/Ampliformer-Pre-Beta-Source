extends Area2D

var auto = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and auto == false:
		# get_tree().paused = true Pause
		# get_tree().change_scene_to_file("res://menu.tscn")
		body.finish1 = true
		auto = true
		$CollisionShape2D.queue_free()
		ThemeSoundtrack.stop()
		$AudioStreamPlayer2D.play()
		$Timer.start()
		pass
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	if GlobalScript.level == 1:
		GlobalScript.checkpos = Vector2(2064, -61)
		get_tree().change_scene_to_file("res://World/Boss1.tscn")
	elif GlobalScript.level == 2:
		GlobalScript.checkpos = Vector2(-248.0, -81.0)
		get_tree().change_scene_to_file("res://World/Betaversion.tscn")
	else:
		print("Error")
	pass # Replace with function body.
