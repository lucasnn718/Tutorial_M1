extends Node

var points = 0
var message_sfx = preload("res://texto.wav")
var music = preload("res://music.wav")
var game_over_music = preload("res://game_over_music.wav")
var win_music = preload("res://win_music.wav")

func play_music():
	$Music.stream = music
	$Music.volume_db = -15
	$Music.play()

func play_game_over_music():
	$Music.stream = game_over_music
	$Music.volume_db = 7
	$Music.play()

func play_win_music():
	$Music.stream = win_music
	$Music.volume_db = -10
	$Music.play()
	
func play_explosion_sfx():
	var pitch_random = rand_range(0.7, 1.7)
	$SoundEffects.pitch_scale = pitch_random
	$SoundEffects.play()

func play_message_sfx():
	$TextSound.stream = message_sfx
	$TextSound.play()

func stop_message_sfx():
	$TextSound.stop()
