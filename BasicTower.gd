extends Tower

class_name BasicTower

"""
Meant to be used as a placeholder to act as a real enemy.
Not to be inherited from.
"""

const HIEGHT = 30
const WIDTH = 30
const SPRITE = 'icon.png'

var attackRange

func _init().(HIEGHT, WIDTH, SPRITE):
	attackRange = DetectionField.new(150)

func _ready():
	pass

func _proccess(delta: float):
	targetActor = Game.closestNodeFromGroups(self, ['enemy'])
	
	if targetActor:
		if attackRange.nodeInRange(targetActor):
			if not attack.active:
				attack.start(targetActor)