extends Area2D

var wait = false
var distance = 0
var direction = 0
var speed = 0

var hp = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wait == false:
		randomize()
		distance = randi_range(0, 1)
		direction = randi_range(0, 1)
		wait = true
		if direction == 1:
			global_position.x = 1374
			$Helicopter.flip_h = false
		else:
			global_position.x = 2874
			$Helicopter.flip_h = true
		if distance == 0:
			scale = Vector2(0.1, 0.1)
			global_position.y = -87
			$CollisionShape2D.disabled = false
			speed = 8
			$Helicopter.play("default")
		else:
			scale = Vector2(0.02, 0.02)
			$CollisionShape2D.disabled = true
			global_position.y = -400
			speed = 5
			$Helicopter.play("new_animation")
	else:
		if direction == 1:
			if global_position.x <= 2874:
				global_position.x += speed
			else:
				wait = false
		else:
			if global_position.x >= 1374:
				global_position.x -= speed
			else:
				wait = false
	pass

func damage():
	print("Damaged")
