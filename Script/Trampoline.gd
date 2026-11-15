extends Area2D

@onready var waiting = $Timer
var condition = false
var velocity1 = -1500

# Boing Sound Effect by Universfield
@onready var animation = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" and condition == false:
		body.velocity.y = velocity1
		animation.play("Trampoline")
		$AudioStreamPlayer2D.play()
		condition = true
		waiting.start()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	condition = false
	animation.play("default")
	pass # Replace with function body.
