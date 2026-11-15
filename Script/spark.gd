extends Area2D

var repeated = false
var random = 0
var condition = false
@onready var oof = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	random = randi_range(0,1)
	if random == 1:
		condition = true
	else:
		condition = false
	$Sprite2D.flip_h = condition
	repeated = false
	oof.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and repeated == false and body.damage1 == false:
		# Added "body.damage1 == false" to prevent both collision.
		repeated = true
		body.ouch2()
		print("Hit")
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
