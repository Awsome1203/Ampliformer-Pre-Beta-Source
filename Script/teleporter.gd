extends Area2D

@onready var pos = $Marker2D
# Teleport Sound Effect by freesound_community
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		# If there's Marker2D
		if pos:
			SoundSystem.volume_db = 2
			SoundSystem.stream = preload("res://Sound Effects/freesound_community-instant-teleport-90645.mp3")
			body.global_position = pos.global_position
			SoundSystem.play()
		else:
			print("Position didn't exist")
	pass # Replace with function body.
