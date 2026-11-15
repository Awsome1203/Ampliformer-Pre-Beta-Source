extends Area2D

# Called when the node enters the scene tree for the first time.
@onready var time = $Timer

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		if body.get_node("FellDown"):
			body.get_node("FellDown").queue_free() # Remove Node
			time.start()
		else:
			print("Null")
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene() # Reload or Reset.
	pass # Replace with function body.
