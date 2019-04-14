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
		