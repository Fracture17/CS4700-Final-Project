extends MovingActor

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

class_name Fighter

var attackRange
var attack

var testHitBox = DirectHitBox.new(2, 0, 20)
var testHitBox3 = RangedHitBox.new(5, 2, 0, 10, false, true, 0, 50, ['enemy', 'spawner'])

func _init(position).(10, 10, 'res://TestBuild/icon.png'):
	self.position = position
	attackRange = DetectionField.new(200)
	add_child(attackRange)
	attack = Attack.new(testHitBox3, 50, 50)
	add_child(attack)
	walkSpeed = .3
	health = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group('player')
	add_to_group('fighter')
	pass # Replace with function body.

func _process(delta: float):
	if dest:
		if moveTowards(dest):
			dest = null
		return
	
	if not is_instance_valid(targetActor):
		targetActor = null
	
	#This currently assumes that enemies ignore players unless players aggro them
	if targetActor == null:
		targetActor = Game.closestNodeFromGroups(self, ['construction'])
	
	targetActor = Game.closestNodeFromGroups(self, ['enemy', 'spawner'])
	
	if targetActor:
		if attackRange.nodeInRange(targetActor):
			if not isAttacking and attack.usable:
				attack.start(self, targetActor)
			return

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
