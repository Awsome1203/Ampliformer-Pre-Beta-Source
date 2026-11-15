extends CharacterBody2D


const SPEED = 300.0
var calculus = 1
const JUMP_VELOCITY = -400.0
var platform = false
var repeat = false
var setlocation = Vector2(-999, -999)

func _ready() -> void:
	platform = false
	setlocation = global_position
	calculus = 1

func _process(delta: float) -> void:
	if platform == true:
		global_position.y += (300 * calculus) * delta
		calculus += 0.025


func _physics_process(delta: float) -> void:
	# Add the gravity.
	pass

	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#velocity.x = direction * SPEED
	#velocity.x = move_toward(velocity.x, 0, SPEED)


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and repeat == false:
		repeat = true
		$Timer.start()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	platform = true
	$CollisionShape2D.disabled = true
	$AudioStreamPlayer2D.play()
	$Timer2.start()
	print("Ready")
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	platform = false
	global_position = setlocation
	$CollisionShape2D.disabled = false
	repeat = false
	print("Ready2")
	calculus = 1
	pass # Replace with function body.
