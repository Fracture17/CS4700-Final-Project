class_name TileFloor extends TilePathable

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _init(H, W, r, c).(H, W, r, c):
	MENU = preload("res://objects/menus/MenuFloor.tscn")
	sprite = Globals.newSprite(H, W, "res://assets/images/TILESET_TEST/0-1-0.png")
	add_child(sprite)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.tileID = 0
	._ready()

""" OVERRIDE
	This function checks for wall tiles only. Water tiles are treated as empty spaces. 
"""
func updateSprite():
	var neighbors = get_parent().getNeighborsOf(self.r, self.c)
	for i in range(neighbors.size()):
		if neighbors[i] != 1:
			neighbors[i] = 0
			
	var num_adjacent = neighbors[1] + neighbors[3] + neighbors[4] + neighbors[6]
		
	var sprid
	
	if num_adjacent == 0:
		sprid = 0;
	elif num_adjacent == 1:
		sprid = (1 * neighbors[1]) + (2 * neighbors[6]) + (3 * neighbors[3]) + (4 * neighbors[4])
	elif num_adjacent == 2:
		var TL = neighbors[1] * neighbors[3]
		var TR = neighbors[1] * neighbors[4]
		var BL = neighbors[6] * neighbors[3]
		var BR = neighbors[6] * neighbors[4]
		sprid = 4 + (1 * neighbors[1] * neighbors[6]) + (2 * neighbors[3] * neighbors[4]) + (3 * TL) + (4 * TR) + (5 * BL) + (6 * BR);
	elif num_adjacent == 3:
		var U = neighbors[3] * neighbors[4] * neighbors[6];
		var D = neighbors[1] * neighbors[3] * neighbors[4];
		var L = neighbors[1] * neighbors[4] * neighbors[6];
		var R = neighbors[1] * neighbors[3] * neighbors[6];
		sprid = 10 + U + (2 * D) + (3 * L) + (4 * R)
	elif num_adjacent == 4:
		sprid = 15
			
	#print(sprid)
	sprite.set_texture(image.TILESET_TEST_FLOOR[sprid])