extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

#class_name Globals

var tileSprites = ['res://TestBuild/TileSprites/0-1-0.png', 'res://TestBuild/TileSprites/0-0-35.png']
#Helper functions for creating new nodes
static func newCircleCollision(radius):
	var collision = CollisionShape2D.new()
	collision.name = 'collision'
	collision.set_shape(newCircleShape(radius))
	return collision
	
static func newCircleShape(radius):
	var shape = CircleShape2D.new()
	shape.set_radius(radius)
	return shape

static func newRectangleCollision(height, width):
	var collision = CollisionShape2D.new()
	collision.name = 'collision'
	collision.set_shape(newRectangleShape(height, width))
	return collision
	
static func newRectangleShape(height, width):
	var shape = RectangleShape2D.new()
	shape.extents = Vector2(width / 2, height / 2)
	return shape
	
static func newSprite(height, width, spritePath):
	var sprite = Sprite.new()
	sprite.name = 'sprite'
	sprite.set_texture(load(spritePath))
	sprite.scale = calcSpriteScale(sprite, height, width)
	return sprite

static func calcSpriteScale(sprite, height, width):
	var size = sprite.get_texture().get_size()
	var scale = Vector2(width / size.x, height / size.y)
	return scale

static func newLight(radius, texture = 'res://TestBuild/rangeLight.png'):
	var light = Light2D.new()
	light.name = 'light'
	light.texture = load(texture)
	light.scale = calcSpriteScale(light, radius * 2, radius * 2)
	return light


func getAllNodesInGroups(groups: Array) -> Array:
	var result = []
	for group in groups:
		var nodes = get_tree().get_nodes_in_group(group)
		for node in nodes:
			if result.find(node) == -1:
				result.append(node)
	return result
	
static func filterNodesInGroups(nodes: Array, groups: Array) -> Array:
	var result = []
	for node in nodes:
		if len(arrayIntersection(node.get_groups, groups)) > 0:
			result.append(node)
	return result

static func arrayIntersection(array1, array2):
	var intersection = []
	for x in array1:
		if array2.has(x):
			intersection.append(x)
	return intersection

static func vector3(vector2):
	return Vector3(vector2.x, vector2.y, 0)

static func deleteNode(node):
	node.queue_free()

func getNodesAt(position):
	var space_state = get_world_2d().get_direct_space_state()
	
	var segment = SegmentShape2D.new()
	segment.set_a(position)
	segment.set_b(position + Vector2(1,0))
	
	var query = Physics2DShapeQueryParameters.new()
	query.set_shape(segment)
	query.set_exclude([self]) # If you want to exclude the object casting the segment
	query.collide_with_areas = true
	
	var hits = space_state.intersect_shape(query)
	return hits

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
