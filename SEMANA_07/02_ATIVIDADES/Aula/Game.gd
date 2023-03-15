extends Node2D

var random_object = RandomNumberGenerator.new()

var count = 0
var running = true

onready var player_scene: PackedScene = preload("res://Player.tscn")
onready var projectile_scene: PackedScene = preload("res://Projectile.tscn")
onready var enemy_scene: PackedScene = preload("res://Enemy.tscn")

onready var player = player_scene.instance()

func _ready():
	$GameOver.hide()
	$GameOver/MenuButton.disabled = true
	$GameOver/TryAgainButton.disabled = true
	
	randomize()
	enemy_spawner()
	player.position = Vector2(350, 720)
	add_child(player)
	
func _process(delta):
	if Global.points >= 101:
		Global.points = 100
		
	if Global.points > 0:
		$Points.text = str(Global.points)
	
	$ParallaxBackground/ParallaxLayer.position.y += 3
	if $ParallaxBackground/ParallaxLayer.position.y >= 0:
		$ParallaxBackground/ParallaxLayer.position.y = -752
	
	if running:
		var posicao = get_global_mouse_position().x
		player.position = player.position.move_toward(Vector2(posicao,720), 5)
		
		if Input.is_action_just_pressed("click") and $ShootCooldown.is_stopped():
			shoot()
	else:
		game_over()
	
		
func shoot():
	if count == 0:
		$ShootCooldown.start()
		var projectile = projectile_scene.instance()
		projectile.position = player.position - Vector2(0, 30)
		add_child(projectile)
	else:
		pass
		
func enemy_spawner():
	if Global.points <= 99:
		var pos = rand_range(24, 672)
		var enemy = enemy_scene.instance()
		enemy.position.x = pos
		add_child(enemy)
		enemy.add_to_group("Enemies")
		$EnemySpawnTime.start()
	else:
		win()

func win():
	if count >= 1:
		pass
	else:
		var enemies = get_tree().get_nodes_in_group("Enemies")
		for elem in enemies:
			if !elem.is_queued_for_deletion():
				elem.collided()
		Global.play_win_music()
		$GameOver.show()
		$GameOver/MenuButton.hide()
		$GameOver/TryAgainButton.hide()
		$GameOver/YouLostText.text = "YOU DID IT!"
		$GameOver/YouLostText/Continuation.text = "You defeated the aliens! We are safe!"
		$GameOver/GameOverFadeIn.play("Win")
		
		count += 1
	
func game_over():
	if count >= 1:
		pass
	else:
		Global.play_game_over_music()
		player.get_node("Ship").hide()
		player.get_node("Weapon").hide()
		player.get_node("CollisionShape2D").free()
		player.get_node("Explosion").emitting = true
		Global.play_explosion_sfx()
		$GameOver.show()
		$GameOver/MenuButton.hide()
		$GameOver/TryAgainButton.hide()
		$GameOver/GameOverFadeIn.play("FadeIn")
		Global.play_message_sfx()
		
		count += 1

func _on_EnemySpawnTime_timeout():
	enemy_spawner()


func _on_GameOverArea_body_entered(body):
	running = false
	body.queue_free()


func _on_ObjectDestroyer_body_entered(body):
		body.queue_free()


func _on_TryAgainButton_pressed():
	Global.play_music()
	Global.points = 0
	get_tree().reload_current_scene()
	

func _on_MenuButton_pressed():
	Global.play_music()
	get_tree().change_scene("res://Menu.tscn")
	


func _on_GameOverFadeIn_animation_finished(anim_name):
	$GameOver/MenuButton.disabled = false
	$GameOver/TryAgainButton.disabled = false
	$GameOver/MenuButton.show()
	$GameOver/TryAgainButton.show()
	Global.stop_message_sfx()
