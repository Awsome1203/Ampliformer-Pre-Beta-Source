extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a = 0 # Transparency
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	#get_tree().change_scene_to_file("res://World/testing.tscn")
	get_tree().change_scene_to_file("res://World/Boss1.tscn")
	pass # Replace with function body.
