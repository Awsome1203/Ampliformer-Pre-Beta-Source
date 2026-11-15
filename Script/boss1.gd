extends CharacterBody2D

var repeat = false
var wait = false
var distance = 0
var direction = 0
var height1 = 0
var speed = 0
var random = 0

var hp = 40
var maxhp = 40
# Called when the node enters the scene tree for the first time.
# Sound Effect by SOLEMAN ALI (GD_SALMAN), freesound_community, floraphonic
func _ready() -> void:
	hp = maxhp
	Globalhealth.bosshp = hp
	Globalhealth.bossmax = maxhp
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wait == false:
		randomize()
		distance = randi_range(0, 1)
		direction = randi_range(0, 1)
		height1 = randi_range(0, 1)
		wait = true
		if direction == 1:
			global_position.x = 1374
			$Helicopter.flip_h = false
		else:
			global_position.x = 2874
			$Helicopter.flip_h = true
		if distance == 0:
			scale = Vector2(1, 1)
			if height1 == 0:
				global_position.y = -87
			else:
				global_position.y = -200
			$Area/CollisionShape2D2.disabled = false
			speed = 8
			$Helicopter.play("default")
			$Attack.stop()
			$Attack2.playing = false
			$Helicopter2.volume_db = 20
		else:
			scale = Vector2(0.2, 0.2)
			$Area/CollisionShape2D2.disabled = true
			global_position.y = -400
			speed = 5
			$Helicopter.play("new_animation")
			$Attack.start()
			$Attack2.playing = true
			$Helicopter2.volume_db = -2
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
	randomize()
	print("Damaged")
	$Metal.pitch_scale = randf_range(0.75, 1.25)
	$Metal.volume_db = randf_range(-4, 2)
	$Metal.play()
	hp -= 1
	Globalhealth.bosshp = hp
	if hp < 1:
		get_tree().change_scene_to_file("res://World/world_2.tscn")


func _on_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and repeat == false and body.damage1 == false:
		repeat = true
		if direction == 1:
			body.animation.flip_h = true
		else:
			body.animation.flip_h = false
		body.ouch3()
		print("Hit")
		$Timer.start()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	repeat = false
	pass # Replace with function body.


func _on_attack_timeout() -> void:
	randomize()
	var spawn = preload("res://Scene/spark.tscn")
	var clone = spawn.instantiate()
	clone.global_position.x = randf_range(global_position.x - 200, global_position.x + 200)
	clone.scale = Vector2(randf_range(0.9, 2), randf_range(0.9, 2))
	clone.global_position.y = -45
	clone.top_level = true
	add_child(clone)
	if distance == 1:
		$Attack.start()
	pass # Replace with function body.
