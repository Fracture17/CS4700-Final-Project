extends Tower

class_name BasicTower

"""
Meant to be used as a placeholder to act as a real enemy.
Not to be inherited from.
"""

const HIEGHT = 30
const WIDTH = 30
const SPRITE = 'res://TestBuild/icon.png'

var testHitbox = RangedHitBox.new(10, 2, 0, 15, false, true, 0, 200, ['enemy'])

var attackRange
var attack

func _init(position).(HIEGHT, WIDTH, SPRITE):
	self.position = position
	attackRange = DetectionField.new(150)
	add_child(attackRange)
	attack = Attack.new(testHitbox, 20, 20)
	add_child(attack)
	

func _ready():
	pass

func _process(delta: float):
	if not is_instance_valid(targetActor):
		targetActor = null
	
	#This currently assumes that enemies ignore players unless players aggro them
	if targetActor == null:
		targetActor = Game.closestNodeFromGroups(self, ['enemy'])
	
	targetActor = Game.closestNodeFromGroups(self, ['enemy'])
	
	if targetActor:
		if attackRange.nodeInRange(targetActor):
			if not isAttacking and attack.usable:
				attack.start(self, targetActor)