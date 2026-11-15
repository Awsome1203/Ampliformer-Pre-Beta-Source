extends Camera2D

var camera = Camera2D
var stop = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position_smoothing_enabled = false
	$Cam1.start()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var parent = get_parent()
	if parent:
		var okay = parent.get_node("Ouch")
		if !okay and stop == false:
			# Camera focus the player position
			position.x = parent.position.x
			position.y = parent.position.y
			top_level = true # Prevent the camera to follow player movement
			stop = true
	pass


func _on_cam_1_timeout() -> void:
	position_smoothing_enabled = true
	pass # Replace with function body.
