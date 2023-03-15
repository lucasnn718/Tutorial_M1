extends KinematicBody2D

func collided():
#função que define o que acontece quando o inimigo colide
	$CollisionShape2D.set_deferred("disabled", true)
	$Sprite.hide()
	$BoostParticles.hide()
	$Explosion.emitting = true
	Global.play_explosion_sfx()
	yield(get_tree().create_timer(0.8), "timeout")
	self.queue_free()

func _process(delta):
	var collision = self.move_and_collide(Vector2(0, 4))
	#definindo o comportamento de movimentação do inimigo e detectando colisões
	if collision:
		if collision.collider.get_script() != null: #garantindo que a colisão não foi com o player
			Global.points += 1
			collision.collider.queue_free()
	
		else: #em caso de colisão com o player
			Global.play_explosion_sfx()
			collision.collider.get_node("Explosion").emitting = true
			collision.collider.get_node("CollisionShape2D").queue_free()
			collision.collider.get_node("Weapon").hide()
			collision.collider.get_node("Ship").hide()
		collided()
