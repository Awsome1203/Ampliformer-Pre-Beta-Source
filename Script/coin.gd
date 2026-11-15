extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		var parents = get_parent()
		if parents:
			SoundSystem.volume_db = -4
			SoundSystem.stream = preload("res://Sound Effects/driken5482-retro-coin-4-236671.mp3")
			SoundSystem.play()
			GlobalScript.coin += 1
			parents.queue_free()
	pass # Replace with function body.
