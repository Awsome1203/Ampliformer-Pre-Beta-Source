extends Area2D

var repeated = false
@onready var wait1 = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and body.damage1 == false and repeated == false:
		# To prevent the action start before node is loaded
		if body.get_node("Ouch"):
			body.get_node("Ouch").queue_free()
			repeated = true
			wait1.start()
		else:
			print("Null")
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	repeated = false
	pass # Replace with function body.
