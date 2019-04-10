extends Area2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

class_name Actor

var targetActor: Actor
var health: float
var stats
var statuses: Array = []
var isAttacking: bool = false

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
	
func getHit(hitbox):
	health -= hitbox.damage
	if health <= 0:
		die()
	
func die():
	queue_free()
	
func onSelection():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
