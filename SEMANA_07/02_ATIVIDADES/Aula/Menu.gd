extends Node2D

#preparando a próxima cena
onready var game: PackedScene = preload("res://Game.tscn")

func _ready():
	$ControlsScreen.hide()
	#escondendo a tela de controles
	
func _process(delta):
	$ParallaxBackground/ParallaxLayer.position.y += 3
	if $ParallaxBackground/ParallaxLayer.position.y >= 0:
		$ParallaxBackground/ParallaxLayer.position.y = -752
	#movendo o background
	
func _on_StartButton_pressed():
	get_tree().change_scene_to(game)
	#mudando a cena ao pressionar o botão

func _on_ControlsButton_pressed():
	$ControlsScreen.show()
	$ControlsButton.disabled = true
	$StartButton.disabled = true
	#mostrando a tela de controles ao pressionar o botão

func _on_BackButton_pressed():
	$ControlsScreen.hide()
	$ControlsButton.disabled = false
	$StartButton.disabled = false
	#voltando à tela normal de menu (escondendo a tela de controles)
