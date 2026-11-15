extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalScript.level = 1
	GlobalScript.checkpos = Vector2(-999, -999)
	GlobalScript.previouscheck = null
	ThemeSoundtrack.stop()
	ThemeSoundtrack.stream = preload("res://Other/Soundtrack 1.mp3")
	ThemeSoundtrack.play()
	GlobalScript.enableability = false
	pass # Replace with function body.
