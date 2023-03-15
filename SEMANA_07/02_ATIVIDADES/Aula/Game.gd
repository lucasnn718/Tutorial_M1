extends Node2D

var count = 0 #variável que ajuda a parar loops contando o número de execuções deles
var running = true #define o estado do jogo e do jogador no jogo

onready var player_scene: PackedScene = preload("res://Player.tscn")
onready var projectile_scene: PackedScene = preload("res://Projectile.tscn")
onready var enemy_scene: PackedScene = preload("res://Enemy.tscn")
#variáveis que armazenam cenas que serão instanciadas na execução do jogo

onready var player = player_scene.instance()
#instanciando o player

func _ready():
	$GameOver.hide()
	$GameOver/MenuButton.disabled = true
	$GameOver/TryAgainButton.disabled = true
	#escondendo a tela de game over e os botões
	
	randomize() #tornando cada execução do jogo randômica
	enemy_spawner() #começando a gerar inimigos
	player.position = Vector2(350, 720) #estabelecendo a posição inicial do player
	add_child(player) #gerando o player
	
func _process(delta):
	if player.get_node("Ship").visible == false:
		running = false #gerando o game over caso o player tenha colidido com um inimigo
	
	if Global.points >= 101:
		Global.points = 100 #não deixando a pontuação passar de 100
		
	if Global.points > 0:
		$Points.text = str(Global.points) #atualizando o display da pontuação
	
	$ParallaxBackground/ParallaxLayer.position.y += 3
	if $ParallaxBackground/ParallaxLayer.position.y >= 0:
		$ParallaxBackground/ParallaxLayer.position.y = -752 #movendo o background
	
	if running:
		var posicao = get_global_mouse_position().x
		player.position = player.position.move_toward(Vector2(posicao,720), 5)
		#atualizando a posição do player de acordo com a posição do mouse
		
		#atirando com o botão esquerdo do mouse
		if Input.is_action_just_pressed("click") and $ShootCooldown.is_stopped():
			shoot()
	else:
		game_over()
		#se a variável running for igual a false, game over
	
		
func shoot():
#função que controla o tiro do jogador e o cooldown dessa ação

	if count == 0: #garantindo que o player não possa atirar depois de ganhar
		$ShootCooldown.start() #começando a contar o tempo de cooldown
		
		var projectile = projectile_scene.instance()
		projectile.position = player.position - Vector2(0, 30)
		add_child(projectile)
		#criando o projétil
	else:
		pass
		
func enemy_spawner():
#função que gera inimigos de acordo com o tempo em posições aleatórias
	
	if Global.points <= 99: #garantindo que inimigos pararão de ser gerados na pontuação 100
		var pos = rand_range(24, 672)
		var enemy = enemy_scene.instance()
		enemy.position.x = pos
		add_child(enemy)
		#gerando um inimigo
		
		enemy.add_to_group("Enemies")
		#adicionando a entidade criada ao grupo para poder excluir todas simultaneamente na vitória
		
		$EnemySpawnTime.start() #começando o timer que limita a geração de inimigos
	else:
		win() #chamando a função de vitória caso o jogador atinja 100 pontos


func win():
#função que determina o que ocorre na vitória do jogador

	if count >= 1: #quebrando o loop após uma execução da função
		pass
	else:
		var enemies = get_tree().get_nodes_in_group("Enemies")
		for elem in enemies:
			if !elem.is_queued_for_deletion():
				elem.collided()
				#destruindo inimigos remanescentes com o uso do grupo "Enemies"
				
		Global.play_win_music()
		$GameOver.show()
		$GameOver/MenuButton.hide()
		$GameOver/TryAgainButton/TryAgainText.text = "PLAY AGAIN"
		$GameOver/TryAgainButton.hide()
		$GameOver/YouLostText.text = "YOU DID IT!"
		$GameOver/YouLostText/Continuation.text = "You defeated the aliens! We are safe!"
		$GameOver/GameOverFadeIn.play("Win")
		#mostrando a tela de game over modificada como tela de vitória
		
		count += 1

func game_over():
#função que define o que acontece quando o jogador perde

	if count >= 1:#quebrando o loop após uma execução da função
		pass
	else:
		if player.get_node("Ship").visible == false:
			#comportamento caso o game over tenha sido gerado por uma colisão entre inimigo e player

			Global.play_game_over_music()
			$GameOver.show()
			$GameOver/MenuButton.hide()
			$GameOver/TryAgainButton.hide()
			$GameOver/GameOverFadeIn.play("FadeIn")
			Global.play_message_sfx()
			#mostrando a tela de game over

			count += 1
		else:
			#comportamento caso o game over tenha sido gerado por um inimigo passando pelo player

			player.get_node("Ship").hide()
			player.get_node("Weapon").hide()
			player.get_node("CollisionShape2D").free()
			player.get_node("Explosion").emitting = true
			Global.play_explosion_sfx()
			#explodindo o player
			
			$GameOver.show()
			$GameOver/MenuButton.hide()
			$GameOver/TryAgainButton.hide()
			$GameOver/GameOverFadeIn.play("FadeIn")
			Global.play_message_sfx()
			#mostrando a tela de game over


func _on_EnemySpawnTime_timeout():
	enemy_spawner()
#gerando inimigos de acordo com o tempo do timer (a cada 1.3 segundo)

func _on_GameOverArea_body_entered(body):
	running = false
	body.queue_free()
#detectando se um inimigo passa pelo player, gerando um game over e destruindo os objetos que passam

func _on_ObjectDestroyer_body_entered(body):
		body.queue_free()
#destruindo os objetos que passam (serve para destruir os projéteis que não atingem inimigos)

func _on_TryAgainButton_pressed():
	Global.play_music()
	Global.points = 0
	get_tree().reload_current_scene()
#recarregando a cena para o jogador jogar novamente ao apertar o botão

func _on_MenuButton_pressed():
	Global.play_music()
	Global.points = 0
	get_tree().change_scene("res://Menu.tscn")
#retornando ao menu ao pressionar o botão


func _on_GameOverFadeIn_animation_finished(anim_name):
	$GameOver/MenuButton.disabled = false
	$GameOver/TryAgainButton.disabled = false
	$GameOver/MenuButton.show()
	$GameOver/TryAgainButton.show()
	Global.stop_message_sfx()
#mostrando os botões nas telas de game over e vitória
