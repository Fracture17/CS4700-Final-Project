class_name TileWater extends TileUnpathable

func _init(H, W, r, c).(H, W, r, c):
	sprite = Globals.newSprite(H, W, "res://assets/images/TILESET_TEST/0-2-0.png")
	add_child(sprite)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	self.tileID = 2
	._ready()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func updateSprite():
	var neighbors = get_parent().getNeighborsOf(self.r, self.c)
	for i in range(neighbors.size()):
		if neighbors[i] != tileID:
			neighbors[i] = 0
		else:
			neighbors[i] = 1
			
	#print(neighbors)
	
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
		sprid = 14 + (4  * U - (U * neighbors[5]) - (2 * U * neighbors[7])) + (8 * D - (D * neighbors[2]) - (2 * D * neighbors[0])) + (12 * L - (L * neighbors[2]) - (2 * L * neighbors[7])) + (16 * R - (R * neighbors[0]) - (2 * R * neighbors[5]))
	elif num_adjacent == 4:
		if num_diagonal == 0:
			sprid = 46
		elif num_diagonal == 1:
			sprid = 39 + (1 * neighbors[7]) + (2 * neighbors[5]) + (3 * neighbors[2]) + (4 * neighbors[0])
		elif num_diagonal == 2:
			sprid = 35 + (1 * neighbors[5] * neighbors[7]) + (2 * neighbors[0] * neighbors[2]) + (3 * neighbors[2] * neighbors[7]) + (4 * neighbors[0] * neighbors[5]) + (9 * neighbors[2] * neighbors[5]) + (10 * neighbors[0] * neighbors[7])
		elif num_diagonal == 3:
			sprid = 31 + (1 * neighbors[2] * neighbors[5] * neighbors[7]) + (2 * neighbors[0] * neighbors[5] * neighbors[7]) + (3 * neighbors[0] * neighbors[2] * neighbors[7]) + (4 * neighbors[0] * neighbors[2] * neighbors[5])
		else:
			sprid = 31
	#print(sprid)
	sprite.set_texture(image.TILESET_TEST_WATER[sprid])
	
func click():
	pass