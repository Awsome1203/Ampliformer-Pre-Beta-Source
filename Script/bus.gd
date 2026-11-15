extends Sprite2D

var count = 0
var exponential = 0
# Bus Sound Effect by freesound_community
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	count = 0
	exponential = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if count >= 400:
		queue_free()
	elif count >= 100:
		position.x += exponential
		exponential *= 1.02
	count += 1
	pass
