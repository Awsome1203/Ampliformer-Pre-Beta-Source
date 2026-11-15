extends Node2D

var direction = false
var bullet1 = preload("res://Scene/Other/Bullet.tscn")
var repeated = false
@onready var oof = $Area2D/Refresh
# Revolver sound effect by freesound_community
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	$AnimatedSprite2D.play("idle")
	$AnimatedSprite2D.flip_h = false
	direction = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var shoot1 = bullet1.instantiate()
	shoot1.global_position = Vector2(global_position.x, global_position.y)
	if direction == false:
		shoot1.direction = false
	else:
		shoot1.direction = true
	shoot1.top_level = true
	add_child(shoot1)
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play("Shoot")
	$Cooldown.start()
	pass # Replace with function body.


func _on_cooldown_timeout() -> void:
	$AnimatedSprite2D.play("idle")
	pass # Replace with function body.


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and repeated == false and body.damage1 == false:
		# Added "body.damage1 == false" to prevent both collision.
		repeated = true
		body.ouch2()
		print("Hit")
		oof.start()
	pass # Replace with function body.


func _on_refresh_timeout() -> void:
	repeated = false
	pass # Replace with function body.
