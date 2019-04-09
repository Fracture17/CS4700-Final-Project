extends Enemy

"""
Meant to be used as a placeholder to act as a real enemy.
Not to be inherited from.
"""

class_name BasicEnemy

const HIEGHT = 10
const WIDTH = 10
const SPRITE = 'res://TestBuild/icon.png'

var attack
var attackRange

func _init().(HIEGHT, WIDTH, SPRITE):
	self.position = Vector2(200, 200)
	attackRange = DetectionField.new(150)
	walkSpeed = .3
	

func _ready():
	pass

func _process(delta: float):
	#This currently assumes that enemies ignore players unless players aggro them
	if targetActor == null:
		targetActor = Game.closestNodeFromGroups(self, ['playerBase'])
	
	if attackRange.nodeInRange(targetActor):
		if not attack.active:
			attack.start(targetActor)
	else:
		moveTowards(targetActor.position)
		
class DetectionField extends Area2D:
	
	const LIGHT_NAME = 'light'
	const COLLISION_NAME = 'collision'
	
	var radius = 100
	var color
	var energy
	var _type_ = 'DetectionField'
	
		
	func getNodesInRange():
		return get_overlapping_areas()
		
	func filterNodesInRange(nodes):
		var result = []
		for node in nodes:
			if nodeInRange(node):
				result.append(node)
		return result
		
	func nodeInRange(node):
		return overlaps_area(node)
		
	func _init(radius):
		name = 'field'
		add_child(Globals.newCircleCollision(radius))
		add_child(Globals.newLight(radius))
		
	func _ready():
		pass