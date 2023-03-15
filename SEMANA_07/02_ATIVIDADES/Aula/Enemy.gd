extends KinematicBody2D

func collided():
	$CollisionShape2D.set_deferred("disabled", true)
	$Sprite.hide()
	$BoostParticles.hide()
	$Explosion.emitting = true
	Global.play_explosion_sfx()
	yield(get_tree().create_timer(0.8), "timeout")
	self.queue_free()

func _process(delta):
	var collision = self.move_and_collide(Vector2(0, 4))
	if collision:
		Global.points += 1
		if collision.collider_velocity.y != 0:
			collision.collider.queue_free()
		collided()
