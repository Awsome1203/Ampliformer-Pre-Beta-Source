extends Node2D

const speed = 320 # Pixels per second
var direction = -1
@onready var body1 = $AnimatedSprite2D
@onready var left1 = $Left
@onready var right1 = $Right
@onready var bottom1 = $Bottom


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !bottom1.is_colliding():
		if direction == 1:
			direction = -1
			body1.flip_h = false
		else:
			direction = 1
			body1.flip_h = true
	else:
		if right1.is_colliding():
			direction = -1
			body1.flip_h = false
		if left1.is_colliding():
			direction = 1
			body1.flip_h = true
	position.x += speed * delta * direction
	body1.play("Walking")
	pass
