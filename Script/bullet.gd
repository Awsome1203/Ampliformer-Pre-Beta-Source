extends Node2D

var direction = false
var waiting = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	waiting += 1
	if waiting <= 50:
		if direction == false:
			global_position.x += 20
			$Area2D/Sprite2D.flip_h = false
		else:
			global_position.x -= 20
			$Area2D/Sprite2D.flip_h = true
	else:
		queue_free()
	pass


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	queue_free()
	pass # Replace with function body.
