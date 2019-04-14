class_name abstract extends Node

class DamageText extends Label:
	
	var speed = 100 + randi()%50
	var decel = 100
	var lifetime = speed/decel
	var direction
	
	func _init(damage, dir = Vector2(0,0)):
		set_text(str(damage))
		direction = dir + Vector2(randf(), randf())
	
	func _process(delta):
		if speed > 0:
			speed -= (decel*delta)
		lifetime -= delta
		
		self.rect_position = self.rect_position + direction * speed * delta
		
		if lifetime < 0:
			queue_free()
			set_process(false)