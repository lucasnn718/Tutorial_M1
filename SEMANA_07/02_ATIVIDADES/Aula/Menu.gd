extends Node2D

onready var game: PackedScene = preload("res://Game.tscn")

func _ready():
	$ControlsScreen.hide()
	
func _process(delta):
	$ParallaxBackground/ParallaxLayer.position.y += 3
	if $ParallaxBackground/ParallaxLayer.position.y >= 0:
		$ParallaxBackground/ParallaxLayer.position.y = -752

func _on_StartButton_pressed():
	get_tree().change_scene_to(game)


func _on_ControlsButton_pressed():
	$ControlsScreen.show()
	$ControlsButton.disabled = true
	$StartButton.disabled = true

func _on_BackButton_pressed():
	$ControlsScreen.hide()
	$ControlsButton.disabled = false
	$StartButton.disabled = false
