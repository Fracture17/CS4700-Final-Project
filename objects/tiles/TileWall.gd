class_name TileWall extends TileUnpathable

func _init(H, W, r, c).(H, W, r, c):
	MENU = preload("res://objects/menus/MenuWall.tscn")
	sprite = Globals.newSprite(H, W, "res://assets/images/TILESET_TEST/0-0-0.png")
	add_child(sprite)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	self.tileID = 1
	._ready()

""" OVERRIDE
	This function checks for wall tiles only. Water tiles are treated as empty spaces. 
"""
func updateSprite():
	var neighbors = get_parent().getNeighborsOf(self.r, self.c)
	for i in range(neighbors.size()):
		if neighbors[i] != tileID:
			neighbors[i] = 0
		else:
			neighbors[i] = 1
	
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
	sprite.set_texture(image.TILESET_TEST_WALL[sprid])
	