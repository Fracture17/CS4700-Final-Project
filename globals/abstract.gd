extends Node

class_name abstract

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

# I know you hate abstract____, but this is the only way I can get GDScript to not complain at me
class aActor extends Node:
	
	var targetActor: Actor
	var health: float
	var tags: Array
	var stats
	var statuses: Array
	var speed: Vector2
	var behaviors: FuncRef
	
	func replaceSprite(spritePath):
		var collision = get_node('collision')
		var spriteSize = collision.shape.extents
		var sprite = get_node('sprite')
		var tempTexture = sprite.texture
		sprite.texture = load(spritePath)
		if sprite.texture == null:
			sprite.texture = tempTexture
		else:
			sprite.scale = Globals.calcSpriteScale(sprite, spriteSize.y, spriteSize.x)
	
	func _init(height, width, spritePath = ''):
		var collision = Globals.newRectangleCollision(height, width)
		add_child(collision)
		
		if spritePath != '':
			var sprite = Globals.newSprite(height, width, spritePath)
			add_child(sprite)
	
	# Called when the node enters the scene tree for the first time.
	func _ready():
		pass # Replace with function body.
		
	func onHit(attack):
		health -= attack.damage
		
		var dt = DamageText.new(attack.damage)
		get_parent().add_child(dt)
		
		if health <= 0:
			die()
		
	func die():
		queue_free()
		
	func onSelection():
		pass
	
class Spawner extends Actor:
	var spawnTimer
	var spawnInterval
	
	func _init(height, width, spritePath = '').(height, width, spritePath):
		pass
		
	func _process(delta):
		spawnTimer -= delta
		if spawnTimer <= 0:
			spawnTimer = spawnInterval
			spawn()
			
		
	func spawn():
		pass
		
class SamplePortal extends Spawner:
	
	func _init(height, width, spritePath = '').(height, width, spritePath):
		spawnTimer = 1
		spawnInterval = 1
		self.global_position = Vector2(100, 100)
		
	func spawn():
		var s = enemy.SampleEnemy.new(10,10)
		s.global_position = self.global_position
		get_parent().add_child(s)