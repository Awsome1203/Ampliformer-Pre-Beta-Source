extends Node2D

var frame = 0
var wait1 = false
# Sound Effects By freesound_community, u_3x9ga8wevj, Eugenia Zanarini, ALEXIS_GAMING_CAM
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frame = 0
	wait1 = false
	SoundSystem.stop()
	ThemeSoundtrack.stop()
	ThemeSoundtrack.stream = preload("res://Cutscene/Introduction (1).mp3")
	ThemeSoundtrack.volume_db = -4
	ThemeSoundtrack.play()
	$Audio1.volume_db = 0
	$Audio2.volume_db = 0
	$Audio3.volume_db = 0
	$Audio4.volume_db = 0
	$Sprite2D.texture = preload("res://Cutscene/Intro/Slide2.JPG")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wait1 == false:
		if frame <= 0:
			$Timer.wait_time = 2.5
			$Timer.start()
			wait1 = true
		elif frame == 1:
			$Timer.wait_time = 7
			$Timer.start()
			
			$Audio1.stream = preload("res://Cutscene/SoundEffects/freesound_community-tapping-spacebar-102841.mp3")
			$Audio2.stream = preload("res://Cutscene/SoundEffects/u_3x9ga8wevj-walking-sound-effect-272246.mp3")
			$Audio3.stream = preload("res://Cutscene/SoundEffects/freesound_community-laser-pistol-shooting-95497.mp3")
			
			$Audio1.play()
			$Audio2.play()
			$Audio3.play()
			
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide3.JPG")
			wait1 = true
		elif frame == 2:
			$Timer.wait_time = 3
			$Timer.start()
			
			$Audio1.stop()
			$Audio2.stop()
			$Audio3.stop()
			
			$Audio4.stream = preload("res://Sound Effects/u_b32baquv5u-8-bit-explosion-10-340462.mp3")
			
			$Audio4.play()
			
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide3.JPG")
			wait1 = true
		elif frame == 3:
			$Timer.wait_time = 3
			$Timer.start()
			
			ThemeSoundtrack.stop()
			$Audio1.stream = preload("res://Cutscene/SoundEffects/ezanarini-air-ambience-234180.mp3")
			
			$Audio1.volume_db = -4
			$Audio1.play()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide4.JPG")
			wait1 = true
		elif frame == 4:
			$Timer.wait_time = 1.5
			$Timer.start()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide5.JPG")
			wait1 = true
		elif frame == 5:
			$Timer.wait_time = 8
			$Timer.start()
			$Vocal.stream = preload("res://Cutscene/Intro/Audio 1.mp3")
			
			$Vocal.play()
			wait1 = true
		elif frame == 6:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Audio4.volume_db = 10
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 7:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 8:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 9:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 10:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 11:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 12:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 13:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 14:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 15:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 16:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 17:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 18:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 19:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 20:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 21:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 22:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 23:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 24:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide6.JPG")
			$Audio4.stream = preload("res://Cutscene/SoundEffects/freesound_community-table-smash-47690.mp3")
			$Timer.wait_time = 0.25
			$Timer.start()
			wait1 = true
		elif frame == 25:
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide7.JPG")
			$Audio4.play()
			$Timer.wait_time = 1
			$Timer.start()
			wait1 = true
		elif frame == 26:
			$Timer.wait_time = 3.5
			$Timer.start()
			$Audio1.stop()
			$Audio1.stream = preload("res://Cutscene/SoundEffects/freesound_community-electricity-101990.mp3")
			
			$Audio1.volume_db = -6
			$Audio1.play()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide8.JPG")
			wait1 = true
		elif frame == 27:
			$Timer.wait_time = 1.5
			$Timer.start()
			$Audio1.stop()
			$Audio1.stream = preload("res://Cutscene/SoundEffects/ezanarini-air-ambience-234180.mp3")
			
			$Audio1.volume_db = -4
			$Audio1.play()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide9.JPG")
			wait1 = true
		elif frame == 28:
			$Timer.wait_time = 17.5
			$Timer.start()
			$Vocal.stream = preload("res://Cutscene/Intro/Audio 2.mp3")
			
			$Vocal.play()
			wait1 = true
		elif frame == 29:
			$Timer.wait_time = 2
			$Timer.start()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide14.JPG")
			wait1 = true
		elif frame == 30:
			$Timer.wait_time = 1
			$Timer.start()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide10.JPG")
			wait1 = true
		elif frame == 31:
			$Timer.wait_time = 11
			$Timer.start()
			$Vocal.stream = preload("res://Cutscene/Intro/Audio 3.mp3")
			
			$Vocal.play()
			wait1 = true
		elif frame == 32:
			$Timer.wait_time = 4
			$Timer.start()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide11.JPG")
			wait1 = true
		elif frame == 33:
			$Timer.wait_time = 5
			$Timer.start()
			$Audio4.stream = preload("res://Cutscene/SoundEffects/alexis_gaming_cam-ding-cartoon-346093.mp3")
			
			$Audio4.play()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide12.JPG")
			wait1 = true
		elif frame == 34:
			$Timer.wait_time = 2.5
			$Timer.start()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide13.JPG")
			wait1 = true
		elif frame == 35:
			$Timer.wait_time = 15
			$Timer.start()
			$Vocal.stream = preload("res://Cutscene/Intro/Audio 4.mp3")
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide14.JPG")
			
			$Vocal.play()
			wait1 = true
		elif frame == 36:
			$Timer.wait_time = 5
			$Timer.start()
			$Audio1.stop()
			$Audio2.stop()
			$Audio3.stop()
			$Audio4.stop()
			$Vocal.stop()
			$Sprite2D.texture = preload("res://Cutscene/Intro/Slide15.JPG")
			ThemeSoundtrack.stop()
			ThemeSoundtrack.stream = preload("res://Cutscene/Introduction (1).mp3")
			ThemeSoundtrack.play()
			wait1 = true
		else:
			ThemeSoundtrack.stop()
			get_tree().change_scene_to_file("res://World/world_1.tscn")
	pass


func _on_timer_timeout() -> void:
	frame += 1
	wait1 = false
	pass # Replace with function body.


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://World/world_1.tscn")
	pass # Replace with function body.
