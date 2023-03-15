extends Node

#cena de controle da variável global da pontuação e dos sons

var points = 0 #pontuação
var message_sfx = preload("res://texto.wav")
var music = preload("res://music.wav")
var game_over_music = preload("res://game_over_music.wav")
var win_music = preload("res://win_music.wav")
#sons do jogo


func play_music():
#toca a música principal do jogo

	$Music.stream = music
	$Music.volume_db = -15
	$Music.play()


func play_game_over_music():
#toca a música de gameover

	$Music.stream = game_over_music
	$Music.volume_db = 7
	$Music.play()


func play_win_music():
#toca a música de vitória

	$Music.stream = win_music
	$Music.volume_db = -10
	$Music.play()


func play_explosion_sfx():
#toca o efeito sonoro de explosão em tons variados

	var pitch_random = rand_range(0.7, 1.7)
	$SoundEffects.pitch_scale = pitch_random
	$SoundEffects.play()


func play_message_sfx():
#toca o efeito sonoro dos textos

	$TextSound.stream = message_sfx
	$TextSound.play()


func stop_message_sfx():
#para o loop do efeito sonoro de textos

	$TextSound.stop()
