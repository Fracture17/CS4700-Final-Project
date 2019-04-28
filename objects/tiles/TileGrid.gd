class_name TileGrid
extends Node2D

var tileSprites = ['res://TestBuild/TileSprites/0-1-0.png', 'res://TestBuild/TileSprites/0-0-35.png']
var baseIndex
var W = 50
var H = 50
var walls
var tiles = []
var wallMap = [
[2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1], 
[2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1], 
[2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 1, 1, 1, 1, 1, 2, 2, 0, 1, 1, 1, 1, 1], 
[2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 2, 0, 0, 1, 1, 1, 1, 1], 
[2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1], 
[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 0, 0, 1, 2, 1, 1, 1, 1, 1, 1], 
[1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1], 
[1, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 1, 1, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1], 
[1, 2, 2, 0, 2, 2, 2, 0, 1, 0, 2, 2, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1], 
[1, 2, 2, 0, 2, 2, 2, 0, 0, 2, 2, 2, 2, 1, 1, 2, 1, 1, 1, 2, 1, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1], 
[1, 1, 2, 0, 2, 2, 0, 1, 1, 2, 0, 2, 2, 1, 1, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[1, 1, 2, 0, 2, 1, 1, 1, 1, 1, 1, 0, 2, 2, 1, 2, 2, 2, 2, 2, 1, 1, 1, 1, 2, 2, 1, 0, 1, 1, 1, 1], 
[1, 1, 2, 0, 2, 0, 1, 1, 1, 0, 0, 2, 2, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 1, 0, 1, 1, 1, 1], 
[1, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 2, 1, 1, 0, 2, 2, 2, 0, 1, 2, 1, 1, 1, 2, 2, 1, 0, 1, 2, 2, 2], 
[1, 2, 2, 0, 2, 2, 2, 0, 1, 0, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 2, 1, 1, 1, 2, 2, 1, 0, 1, 2, 2, 2], 
[1, 2, 2, 0, 2, 2, 2, 0, 0, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2], 
[1, 1, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2], 
[1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 2, 2, 2]]



var ROWS = wallMap.size()
var COLS = wallMap[0].size()

var activeMenu

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
			elif wallMap[r][c] == 3:
				T = TileSpawner.new(H, W, r, c)
			elif wallMap[r][c] == 4:
				setBase(r, c)
				T = TileBasePlayer.new(H, W, r, c)
			elif wallMap[r][c] == 5:
				T = TileTower.new(H, W, r, c)
			else:
				T = TileWall.new(H, W, r, c)
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
	var pos = tiles[r][c].global_position
	Game.A.add_point(r * COLS + c, Vector3(pos.x, pos.y, tiles[r][c].tileID))
	if (tiles[r][c].pathable == true):
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
	#print(Game.A.get_points())
			
func setBase(r, c):
	baseIndex = posIndex(r, c)

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
	elif t == 3:
		tiles[r][c] = TileSpawner.new(H, W, r, c)
	elif t == 4:
		setBase(r, c)
		tiles[r][c] = TileBasePlayer.new(H, W, r, c)
	elif t == 5:
		tiles[r][c] = TileTower.new(H, W, r, c)
	else:
		tiles[r][c] = TileWall.new(H, W, r, c)
	add_child(tiles[r][c])
	wallMap[r][c] = t
	tiles[r][c].updateSprite()
	if t == 0:
		addSquareAStar(r, c)
	updateNeighborsOf(r, c)

func getNeighborsOf(r, c):
	var ret = [-1,-1,-1,-1,-1,-1,-1,-1]
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