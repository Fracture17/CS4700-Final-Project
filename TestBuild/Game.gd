extends Node2D

var playerGold = 0
var tileGrid

var A = AStar.new()

func _init():
	tileGrid = TileGrid.new()
	add_child(tileGrid)

func closestNodeFromGroups(node, targetGroups):
	var targets = Globals.getAllNodesInGroups(targetGroups)
	return getClosestTarget(node, targets)

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
	var startPos = Globals.vector3(node.position)
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
