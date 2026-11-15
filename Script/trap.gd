extends Area2D

var wait = 0
var stop = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wait = 0
	stop = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stop == true:
		if wait <= 9000:
			$Sprite2D.position.x += 1.75
			print($Sprite2D.position.x)
			wait += 1
		else:
			queue_free()
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and stop == false:
		stop = true
		print("Activated")
		pass
	pass # Replace with function body.


func _on_spikey_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and body.damage1 == false:
		# To prevent the action start before node is loaded
		if body.get_node("Ouch"):
			body.get_node("Ouch").queue_free()
		else:
			print("Null")
	pass # Replace with function body.
