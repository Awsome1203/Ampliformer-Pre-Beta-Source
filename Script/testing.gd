extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalScript.checkpos = Vector2(-999, -999)
	GlobalScript.previouscheck = null
	ThemeSoundtrack.stop()
	ThemeSoundtrack.stream = preload("res://Other/Perspective (Extended).mp3")
	ThemeSoundtrack.play()
	GlobalScript.enableability = true
	GlobalScript.level = 2
	pass # Replace with function body.
