extends Node2D

var playerGold = 100
var tileGrid

var A = AStar.new()
var F1 = MouseDetection.new(2)
var F2 = MouseDetection.new(30)

func addSquareAStar(i, x, y):
	#var S = Globals.newSprite(5, 5, 'res://TestBuild/TileSprites/0-0-20.png')
	#S.position = Vector2(x, y)
	#add_child(S)
	A.add_point(i, Vector3(x, y, 0))
	#A.connect_points(i, i + 23)
	A.connect_points(i, i - 23)
	#A.connect_points(i, i + 1)
	#if i % 13 != 0:
	A.connect_points(i, i - 1)

func _init():
	add_child(F1)
	add_child(F2)
	return
	tileGrid = TileGrid.new()
	add_child(tileGrid)
	
func closestNodeFromGroups(node, targetGroups):
	var targets = Globals.getAllNodesInGroups(targetGroups)
	var x = getClosestTarget(node, targets)
	if x and x.get('a') == 5:
		print('a')
	return x

func getClosestTarget(node, targets):
	var nodePoint = A.get_closest_point(Globals.vector3(node.position))
	var minDist = INF
	var closestTarget = null
	for target in targets:
		var targetPoint = A.get_closest_point(Globals.vector3(target.position))
		var path = A.get_id_path(nodePoint, targetPoint)
		if len(path) < minDist:
			minDist = len(path)
			closestTarget = target
	return closestTarget
	
func navigate(node, dest, speed = 1.0):
	var startPos = Globals.vector3(node.global_position)
	var endPos = Globals.vector3(dest)
	var closestIDStart = A.get_closest_point(startPos)
	var closestIDEnd = A.get_closest_point(endPos)
	var path = A.get_point_path(closestIDStart, closestIDEnd)
	if len(path) == 0:
		return Vector2(0,0)
	if len(path) <= 2:
		return (Vector2(dest.x, dest.y) - node.position).clamped(speed)
	var direction = path[1] - startPos
	return Vector2(direction.x, direction.y).clamped(speed)

func _ready():
	pass
