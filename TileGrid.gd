extends Node2D

class_name TileGrid

var tileSprites = ['res://TileSprites//0-1-0.png', 'res://TileSprites//0-0-35.png']
var layout = []
var ROWS = 12
var COLS = 18
var baseIndex
var H = 50
var W = 50
var walls
var pathmap = []
var tiles = []
var sprites = [preload("res://TileSprites//0-0-0.png"),
	preload("res://TileSprites//0-0-1.png"),
	preload("res://TileSprites//0-0-2.png"),
	preload("res://TileSprites//0-0-3.png"),
	preload("res://TileSprites//0-0-4.png"),
	preload("res://TileSprites//0-0-5.png"),
	preload("res://TileSprites//0-0-6.png"),
	preload("res://TileSprites//0-0-7.png"),
	preload("res://TileSprites//0-0-8.png"),
	preload("res://TileSprites//0-0-9.png"),
	preload("res://TileSprites//0-0-10.png"),
	preload("res://TileSprites//0-0-11.png"),
	preload("res://TileSprites//0-0-12.png"),
	preload("res://TileSprites//0-0-13.png"),
	preload("res://TileSprites//0-0-14.png"),
	preload("res://TileSprites//0-0-15.png"),
	preload("res://TileSprites//0-0-16.png"),
	preload("res://TileSprites//0-0-17.png"),
	preload("res://TileSprites//0-0-18.png"),
	preload("res://TileSprites//0-0-19.png"),
	preload("res://TileSprites//0-0-20.png"),
	preload("res://TileSprites//0-0-21.png"),
	preload("res://TileSprites//0-0-22.png"),
	preload("res://TileSprites//0-0-23.png"),
	preload("res://TileSprites//0-0-24.png"),
	preload("res://TileSprites//0-0-25.png"),
	preload("res://TileSprites//0-0-26.png"),
	preload("res://TileSprites//0-0-27.png"),
	preload("res://TileSprites//0-0-28.png"),
	preload("res://TileSprites//0-0-29.png"),
	preload("res://TileSprites//0-0-30.png"),
	preload("res://TileSprites//0-0-31.png"),
	preload("res://TileSprites//0-0-32.png"),
	preload("res://TileSprites//0-0-33.png"),
	preload("res://TileSprites//0-0-34.png"),
	preload("res://TileSprites//0-0-35.png"),
	preload("res://TileSprites//0-0-36.png"),
	preload("res://TileSprites//0-0-37.png"),
	preload("res://TileSprites//0-0-38.png"),
	preload("res://TileSprites//0-0-39.png"),
	preload("res://TileSprites//0-0-40.png"),
	preload("res://TileSprites//0-0-41.png"),
	preload("res://TileSprites//0-0-42.png"),
	preload("res://TileSprites//0-0-43.png"),
	preload("res://TileSprites//0-0-44.png"),
	preload("res://TileSprites//0-0-45.png"),
	preload("res://TileSprites//0-0-46.png"),
	preload("res://TileSprites//0-0-47.png"),
	preload("res://TileSprites//0-0-48.png"),
	preload("res://TileSprites//0-0-49.png"),
	preload("res://TileSprites//0-0-50.png"),
	preload("res://TileSprites//0-0-51.png"),
	preload("res://TileSprites//0-0-52.png")]
var wallMap = []

func _ready():
	convertWallMap(wallMap)
	
	for r in range(ROWS):
		layout.append([])
		var row = []
		var trow = []
		for c in range(COLS):
			var T = Tile.new(tileSprites[0], H, W, r, c)
				
			row.append(0)
			get_tree().get_root().get_node('Main').add_child(T)
			layout[-1].append(T)
			trow.append(T)
		pathmap.append(row)
		tiles.append(trow)
		
	initAStar()
	
	for x in walls:
		layout[x[0]][x[1]].toggleType()

func posIndex(r, c):
	return COLS * r + c

func addSquareAStar(r, c):
	var pos = layout[r][c].position
	Game.A.add_point(r * COLS + c, Vector3(pos.x, pos.y, 0))
	if r + 1 < ROWS:
		Game.A.connect_points(posIndex(r, c), posIndex(r + 1, c))
	if r - 1 >= 0:
		Game.A.connect_points(posIndex(r, c), posIndex(r - 1, c))
	if c + 1 < COLS:
		Game.A.connect_points(posIndex(r, c), posIndex(r, c + 1))
	if c - 1 >= 0:
		Game.A.connect_points(posIndex(r, c), posIndex(r, c - 1))
		
func removeSquareAStar(r, c):
	Game.A.remove_point(posIndex(r, c))

func initAStar():
	for r in range(ROWS):
		for c in range(COLS):
			addSquareAStar(r, c)
			
func setBase(r, c):
	baseIndex = posIndex(r, c)
	
func convertWallMap(map):
	walls = []
	for r in range(len(map)):
		for c in range(len(map[0])):
			if map[r][c] == 1:
				walls.append([r, c])
				
func updateNeighborsOf(r, c):
	if r-1 >= 0 :
		if c-1 >= 0:
			tiles[r-1][c-1].updateSprite()
		if c+1 < COLS:
			tiles[r-1][c+1].updateSprite()
		tiles[r-1][c].updateSprite()
		
	if c-1 >= 0:
		tiles[r][c-1].updateSprite()
	if c+1 < COLS:
		tiles[r][c+1].updateSprite()

	if r+1 < ROWS:	
		if c-1 >= 0:
			tiles[r+1][c-1].updateSprite()
		if c+1 < COLS:
			tiles[r+1][c+1].updateSprite()
		tiles[r+1][c].updateSprite()
	

func getNeighborsOf(r, c):
	var ret = [1,1,1,1,1,1,1,1]
	if r-1 >= 0 :
		if c-1 >= 0:
			ret[0] = pathmap[r-1][c-1]
		if c+1 < COLS:
			ret[2] = pathmap[r-1][c+1]
		ret[1] = pathmap[r-1][c]
		
	if c-1 >= 0:
		ret[3] = pathmap[r][c-1]
	if c+1 < COLS:
		ret[4] = pathmap[r][c+1]

	if r+1 < ROWS:	
		if c-1 >= 0:
			ret[5] = pathmap[r+1][c-1]
		if c+1 < COLS:
			ret[7] = pathmap[r+1][c+1]
		ret[6] = pathmap[r+1][c]
	
	#print(str(ret[0]) + " " + str(ret[1]) + " " + str(ret[2]) + "\n" + str(ret[3]) + "   " + str(ret[4]) + "\n" + str(ret[5]) + " " + str(ret[6]) + " " + str(ret[7]))
	
	return ret