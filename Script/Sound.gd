extends Node2D

var maximum = 0
var whereposition = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if whereposition == 1:
		$Area2D/Sprite2D.flip_h = false
	else:
		$Area2D/Sprite2D.flip_h = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if maximum <= 100:
		position.x += whereposition * 20
		maximum += 1
	else:
		queue_free()
	pass


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Boss":
		body.damage()
		queue_free()
	pass # Replace with function body.
