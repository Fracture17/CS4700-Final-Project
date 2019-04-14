class_name TileGrid
extends Node2D

var tileSprites = ['res://TestBuild/TileSprites/0-1-0.png', 'res://TestBuild/TileSprites/0-0-35.png']
var baseIndex
var H = 50
var W = 50
var walls
var tiles = []
var wallMap = [[2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
[2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
[2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2], 
[2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 2], 
[2, 2, 2, 2, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 2, 2], 
[1, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 0, 1, 1, 0, 2, 2, 2], 
[1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 2, 2], 
[1, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 0, 2, 2, 2], 
[1, 2, 2, 0, 2, 2, 2, 0, 1, 0, 2, 2, 1, 1, 0, 1, 2, 2], 
[1, 2, 2, 0, 2, 2, 2, 0, 0, 2, 2, 2, 2, 1, 0, 1, 1, 1], 
[1, 1, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1], 
[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]

var ROWS = wallMap.size()
var COLS = wallMap[0].size()

func _ready():

	for r in range(ROWS):
		var row = []
		for c in range(COLS):
			var T
			if wallMap[r][c] == 0:
				T = TileFloor.new(H, W, r, c)
			elif wallMap[r][c] == 1:
				T = TileWall.new(H, W, r, c)
			elif wallMap[r][c] == 2:
				T = TileWater.new(H, W, r, c)
			add_child(T)
			row.append(T)
		tiles.append(row)
		
	initAStar()
	
	for r in range(ROWS):
		for c in range(COLS):
			tiles[r][c].updateSprite()

func posIndex(r, c):
	return COLS * r + c

func addSquareAStar(r, c):
	var pos = tiles[r][c].position
	Game.A.add_point(r * COLS + c, Vector3(pos.x, pos.y, 0))
	if r + 1 < ROWS:
		if wallMap[r + 1][c] == 0:
			Game.A.connect_points(posIndex(r, c), posIndex(r + 1, c))
	if r - 1 >= 0:
		if wallMap[r - 1][c] == 0:
			Game.A.connect_points(posIndex(r, c), posIndex(r - 1, c))
	if c + 1 < COLS:
		if wallMap[r][c + 1] == 0:
			Game.A.connect_points(posIndex(r, c), posIndex(r, c + 1))
	if c - 1 >= 0:
		if wallMap[r][c - 1] == 0:
			Game.A.connect_points(posIndex(r, c), posIndex(r, c - 1))
		
func removeSquareAStar(r, c):
	Game.A.remove_point(posIndex(r, c))

func initAStar():
	for r in range(ROWS):
		for c in range(COLS):
			if (tiles[r][c].pathable == true):
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
	# print("updated neighbors")
	
func replace(r, c, t):
	# print(t)
	tiles[r][c].queue_free()
	if t == 0:
		tiles[r][c] = TileFloor.new(H, W, r, c)
	elif t == 1:
		tiles[r][c] = TileWall.new(H, W, r, c)
	elif t == 2:
		tiles[r][c] = TileWater.new(H, W, r, c)
	add_child(tiles[r][c])
	wallMap[r][c] = t
	tiles[r][c].updateSprite()

func getNeighborsOf(r, c):
	var ret = [1,1,1,1,1,1,1,1]
	if r-1 >= 0 :
		if c-1 >= 0:
			ret[0] = wallMap[r-1][c-1]
		if c+1 < COLS:
			ret[2] = wallMap[r-1][c+1]
		ret[1] = wallMap[r-1][c]
		
	if c-1 >= 0:
		ret[3] = wallMap[r][c-1]
	if c+1 < COLS:
		ret[4] = wallMap[r][c+1]

	if r+1 < ROWS:	
		if c-1 >= 0:
			ret[5] = wallMap[r+1][c-1]
		if c+1 < COLS:
			ret[7] = wallMap[r+1][c+1]
		ret[6] = wallMap[r+1][c]
	 
	return ret
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_P:
			print("var wallMap = " + str(wallMap) + "\n")