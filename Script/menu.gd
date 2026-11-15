extends Node2D

var waiting = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.position = Vector2(-200, 390)
	$AnimatedSprite2D.play("Walking")
	ThemeSoundtrack.stop()
	ThemeSoundtrack.stream = preload("res://Other/Project_1.mp3")
	ThemeSoundtrack.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if waiting <= 500:
		$AnimatedSprite2D.position.x += 2
		waiting += 2
	elif waiting >= 501 and waiting <= 1000:
		$AnimatedSprite2D.play("Idle")
		waiting = 1001
		print("Spawn")
	pass
