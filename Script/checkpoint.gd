extends Sprite2D

# Called when the node enters the scene tree for the first time.
const bus = preload("res://Scene/bus.tscn")

func _ready() -> void:
	_update2()
	_update()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update() -> void:
	if $Marker2D.global_position == GlobalScript.checkpos:
		frame = 1
	else:
		frame = 0

func _update2() -> void:
	# $Marker2D.global_position == GlobalScript.position2 will match the position of checkpoint
	if GlobalScript.ischecked == true and $Marker2D.global_position == GlobalScript.position2:
		var instance1 = bus.instantiate()
		add_child(instance1)
		instance1.global_position = GlobalScript.position2
		instance1.position.y = -5
		print("Clone")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GlobalScript.checkpos = $Marker2D.global_position
		GlobalScript.position2 = $Marker2D.global_position
		if GlobalScript.previouscheck:
			GlobalScript.previouscheck._update()
		if frame == 0:
			$AudioStreamPlayer2D.play()
		GlobalScript.previouscheck = self
		GlobalScript.ischecked = true
		_update()
	pass # Replace with function body.
