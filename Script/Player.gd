extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -700.0
@onready var animation = $AnimatedSprite2D
@onready var fell1 = $FellDown
@onready var ouch1 = $Ouch
@onready var collision2 = $CollisionShape2D
@onready var time = $Timer
@onready var sound1 = $AudioStreamPlayer2D
var boss = false
var stop = false
var damage1 = false
var damage2 = false
var guitarenabled = false

var finish1 = false
var finish2 = false
var finish3 = false
#Jump and Guitar Sound Effect by freesound_community
#Damage Sound Effect by u_b32baquv5u
#Footstep and Fall Sound Effect by Universfield
#Sound effect

#Guitar Sound Effect Ability is Original and made in Soundtrap
var falling = false
var jumps = preload("res://Sound Effects/freesound_community-cartoon-jump-6462.mp3")
var ouchys = preload("res://Sound Effects/u_b32baquv5u-8-bit-explosion-10-340462.mp3")

var sound2 = preload("res://Scene/Sound.tscn")

func _ready() -> void:
	falling = false
	Globalhealth.health = Globalhealth.maxhealth # Load Health
	finish1 = false
	finish2 = false
	finish3 = false
	if GlobalScript.checkpos != Vector2(-999, -999):
		global_position = GlobalScript.checkpos
	pass


func _physics_process(delta: float) -> void:
	# If Game Over
	if !ouch1:
		if stop == false:
			Globalhealth.health = 0
			$Sound2.volume_db = 18
			$Sound2.stream = preload("res://Sound Effects/Footstep/freesound_community-guitar-93245.mp3")
			animation.flip_h = false
			velocity.y = JUMP_VELOCITY
			collision2.queue_free()
			$Sound2.play()
			time.start() # Reason why I put there is to prevent looping.
			# Preventing the action to freeze
		velocity.x = 0
		stop = true
	# Add the gravity.
	if not is_on_floor():
		if finish2 == false:
			velocity += get_gravity() * delta
		if $Footstep.playing:
			$Footstep.playing = false
		if damage1 == false:
			if !ouch1:
				if velocity.y > 0:
					animation.play("Game Over Down")
				else:
					animation.play("Game Over Up")
			else:
				if guitarenabled == false:
					if velocity.y > 0:
						animation.play("Fall")
					else:
						animation.play("Ready Jump")
	
	if is_on_floor() and damage1 == true and stop == true:
		damage1 = false
		stop = false
		damage2 = false
	if is_on_floor() and finish1 == true and finish3 == false:
		finish2 = true
		finish3 = true
	# If damaged
	if damage1 == true and finish1 == false:
		if damage2 == false:
			sound1.stream = ouchys
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if boss == false:
				velocity.y = JUMP_VELOCITY * 0.5
			else:
				velocity.y = JUMP_VELOCITY * 1
			animation.play("Ouchy")
			Globalhealth.health -= 1
			sound1.play()
			stop = true
			damage2 = true
		else:
			if animation.flip_h == false:
				velocity.x = -1.5 * SPEED
			else:
				velocity.x = 1.5 * SPEED
	
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor() and stop == false and finish1 == false:
		sound1.stream = jumps
		velocity.y = JUMP_VELOCITY
		sound1.play()
	
	if !fell1:
		if stop == true:
			Globalhealth.health = 0
		if falling == false:
			$Sound2.volume_db = 0
			$Sound2.stream = preload("res://Sound Effects/Footstep/universfield-whistle-slide-down-04-352454.mp3")
			$Sound2.play()
			falling = true
		velocity.x = 0
		stop = true
	
	if velocity.length() == 0  and damage1 == false and finish1 == false:
		if $Footstep.playing:
			$Footstep.playing = false
		if guitarenabled == false:
			animation.play("Idle")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if Input.is_action_just_pressed("Guitar") and GlobalScript.enableability == true and guitarenabled == false and stop == false and finish1 == false:
		randomize()
		var random = randi_range(12, 24)
		var multiply = randi_range(1, 2)
		var ability1 = sound2.instantiate()
		ability1.position = position
		ability1.top_level = true
		if animation.flip_h == false:
			ability1.whereposition = 1
		else:
			ability1.whereposition = -1
		add_child(ability1)
		guitarenabled = true
		animation.play("Rock")
		$PowerChordC.pitch_scale = 0.5 * (float(random) / 12) * multiply
		$PowerChordC.play()
		$Guitar1.start()
		pass
	
	if finish1 == true:
		animation.flip_h = false
	
	if finish2 == true:
		velocity.x = 1.5 * SPEED
		animation.play("Walking")

	if direction and stop == false and finish1 == false:
		if velocity.x > 0:
			animation.flip_h = false
		elif velocity.x < 0:
			animation.flip_h = true
		if is_on_floor():
			if guitarenabled == false:
				animation.play("Walking")
				if not $Footstep.playing:
					$Footstep.playing = true
		
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func ouch2():
	if Globalhealth.health > 1 and damage1 == false:
		damage1 = true
		boss = false
	else:
		# Prevent player collide both hitbox that cause null error
		if ouch1:
			ouch1.queue_free()

func ouch3():
	if Globalhealth.health > 1 and damage1 == false:
		damage1 = true
		boss = true
	else:
		# Prevent player collide both hitbox that cause null error
		if ouch1:
			ouch1.queue_free()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_guitar_1_timeout() -> void:
	guitarenabled = false
	pass # Replace with function body.
