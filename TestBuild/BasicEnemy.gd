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

var testHitBox = AreaHitBox.new(200, 1, 0, Vector2(0,0), false, 0, 100, ['playerBase', 'player'])
var testHitBox2 = DirectHitBox.new(2, 0, 20)
var testHitBox3 = RangedHitBox.new(5, 2, 0, 10, false, true, 0, 50, ['playerBase', 'player'])

func _init(position).(HIEGHT, WIDTH, SPRITE):
	get_node('sprite').modulate = Color(2, 0, 0)
	self.position = position
	attackRange = DetectionField.new(20)
	add_child(attackRange)
	attack = Attack.new(testHitBox3, 50, 50)
	add_child(attack)
	walkSpeed = .2
	health = 5

func _ready():
	pass

func _process(delta: float):
	if not is_instance_valid(targetActor):
		targetActor = null
	
	#This currently assumes that enemies ignore players unless players aggro them
	if targetActor == null:
		targetActor = Game.closestNodeFromGroups(self, ['playerBase', 'player'])
	
	if targetActor:
		if attackRange.nodeInRange(targetActor):
			if not isAttacking and attack.usable:
				attack.start(self, targetActor)
		else:
			moveTowards(targetActor.global_position)