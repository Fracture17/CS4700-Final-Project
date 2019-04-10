extends Area2D

"""
This should be edited so TileGrid controls all of the r,c coordinates.
"""

var type = 0
var r
var c
var isBase = false

class_name Tile
func _init(spritePath, H, W, r, c):
	var collision = Globals.newRectangleCollision(H, W)
	add_child(collision)
	
	if spritePath != '':
		var sprite = Globals.newSprite(H, W, spritePath)
		add_child(sprite)
	
	position.x = c * (W + 1) + W / 2 + 1
	position.y = r * (H + 1) + H / 2
	self.r = r
	self.c = c

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group('tiles')
	pass
	
	
	
func onArea2Dinputevent( viewport, event, shapeidx ):
	if isBase:
		return
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		self.toggleType()
		#type = (type + 1) % len(get_tree().get_root().get_node('Main').tileSprites)
		#	get_tree().get_root().get_node('Main').addSquareAStar(r, c)
		#else:
		#	get_tree().get_root().get_node('Main').removeSquareAStar(r, c)
		
		
		#var x = self.get_child(0)
		#var spriteSize = self.get_child(0).shape.extents
		#self.get_child(1).texture = load(get_tree().get_root().get_node('Main').tileSprites[type])
		#self.get_child(1).scale = Globals.calcSpriteScale(self.get_child(1), spriteSize.y, spriteSize.x)
		#var tower = Tower.make(self)
		#get_tree().get_root().get_node('Main').add_child(tower)
		#Globals.deleteNode(self)
		
func toggleType():
	type = (type + 1) % len(get_tree().get_root().get_node('Main').tileSprites)
	if type == 0:
		get_tree().get_root().get_node('Main').addSquareAStar(r, c)
		get_parent().pathmap[r][c] = 0
	else:
		get_tree().get_root().get_node('Main').removeSquareAStar(r, c)
		get_parent().pathmap[r][c] = 1
	
	var x = self.get_child(0)
	var spriteSize = self.get_child(0).shape.extents
	self.updateSprite()
	get_parent().updateNeighborsOf(r,c)
	
func updateSprite():
	if type==0:
		self.get_child(1).texture = load(get_tree().get_root().get_node('Main').tileSprites[type])
	else:
		var neighbors = get_parent().getNeighborsOf(self.r, self.c)
		
		var num_adjacent = neighbors[1] + neighbors[3] + neighbors[4] + neighbors[6]
		var num_diagonal = neighbors[0] + neighbors[2] + neighbors[5] + neighbors[7]
		
		var sprid
		
		if num_adjacent == 0:
			sprid = 0;
		elif num_adjacent == 1:
			sprid = (1 * neighbors[6]) + (2 * neighbors[1]) + (3 * neighbors[4]) + (4 * neighbors[3])
		elif num_adjacent == 2:
			var TL = neighbors[1] * neighbors[3]
			var TR = neighbors[1] * neighbors[4]
			var BL = neighbors[6] * neighbors[3]
			var BR = neighbors[6] * neighbors[4]
			sprid = 4 + (1 * neighbors[1] * neighbors[6]) + (2 * neighbors[3] * neighbors[4]) + (3 * BR + (4 * BR * neighbors[7])) + (4 * BL + (4 * BL * neighbors[5])) + (5 * TR + (4 * TR * neighbors[2])) + (6 * TL + (4 * TL * neighbors[0]));
		elif num_adjacent == 3:
			var U = neighbors[3] * neighbors[4] * neighbors[6];
			var D = neighbors[1] * neighbors[3] * neighbors[4];
			var L = neighbors[1] * neighbors[4] * neighbors[6];
			var R = neighbors[1] * neighbors[3] * neighbors[6];
			sprid = 14 + (5  * U - (U * neighbors[5]) - (2 * U * neighbors[7]) - (1 * U * neighbors[5] * neighbors[7])) + (10 * D - (D * neighbors[0]) - (2 * D * neighbors[2]) - (1 * D * neighbors[2] * neighbors[0])) + (15 * L - (L * neighbors[2]) - (2 * L * neighbors[7]) - (1 * L * neighbors[7] * neighbors[2])) + (20 * R - (R * neighbors[0]) - (2 * R * neighbors[5]) - (1 * R * neighbors[5] * neighbors[0]))
		elif num_adjacent == 4:
			if num_diagonal == 0:
				sprid = 52
			elif num_diagonal == 1:
				sprid = 45 + (neighbors[7]) + (2 * neighbors[5]) + (3 * neighbors[2]) + (4 * neighbors[0])
			elif num_diagonal == 2:
				sprid = 41 + (1 * neighbors[5] * neighbors[7]) + (2 * neighbors[0] * neighbors[2]) + (3 * neighbors[2] * neighbors[7]) + (4 * neighbors[0] * neighbors[5]) + (9 * neighbors[2] * neighbors[5]) + (10 * neighbors[0] * neighbors[7])
			elif num_diagonal == 3:
				sprid = 37 + (1 * neighbors[2] * neighbors[5] * neighbors[7]) + (2 * neighbors[0] * neighbors[5] * neighbors[7]) + (3 * neighbors[0] * neighbors[2] * neighbors[7]) + (4 * neighbors[0] * neighbors[2] * neighbors[5])
			else:
				sprid = 35 + (randi()%3)
				
		#print(sprid)
		self.get_child(1).set_texture(get_tree().get_root().get_node('Main').sprites[sprid])