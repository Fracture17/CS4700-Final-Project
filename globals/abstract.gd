# I know you hate abstract____, but this is the only way I can get GDScript to not complain at me
class AbstractActor extends Node:
	
	var targetActor: Actor
	var health: float
	var tags: Array
	var stats
	var statuses: Array
	var speed: Vector2
	
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
	func _ready() -> void:
		pass # Replace with function body.
		
	func onHit(attack):
		health -= attack.damage
		if health <= 0:
			die()
		
	func die():
		queue_free()
		
	func onSelection():
		pass
	
	
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
	#func _process(delta: float) -> void:
	#	pass
