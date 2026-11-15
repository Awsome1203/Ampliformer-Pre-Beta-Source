extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalScript.checkpos = Vector2(-999, -999)
	GlobalScript.previouscheck = null
	ThemeSoundtrack.stop()
	ThemeSoundtrack.stream = preload("res://Other/Arid with Tumbleweed 2.mp3")
	ThemeSoundtrack.play()
	GlobalScript.enableability = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
