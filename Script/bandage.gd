extends Area2D

#Bandage Sound Effect made in Soundtrap the C Major Chord
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and Globalhealth.health < Globalhealth.maxhealth:
		var parents = get_parent()
		if parents:
			SoundSystem.volume_db = -2
			SoundSystem.stream = preload("res://Sound Effects/Bandage Sound.mp3")
			Globalhealth.health += 1
			SoundSystem.play()
			parents.queue_free()
	pass # Replace with function body.
