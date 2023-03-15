extends Node2D

#preparando a próxima cena
onready var menu_scene: PackedScene = preload("res://Menu.tscn")

func _ready():
	$StoryAnim.play("StoryFadeIn")
	Global.play_message_sfx()
	#animação e efeito sonoro do início

func _process(delta):
	$ParallaxBackground/ParallaxLayer.position.y += 3
	if $ParallaxBackground/ParallaxLayer.position.y >= 0:
		$ParallaxBackground/ParallaxLayer.position.y = -752
	#movendo o background
	
func _on_StoryAnim_animation_finished(anim_name):
	Global.play_music()
	Global.stop_message_sfx()
	get_tree().change_scene_to(menu_scene)
	#mudando o som e a cena
