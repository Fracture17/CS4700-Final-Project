extends MovingActor

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

class_name Worker

var attackRange
var attack

var testHitBox = DirectHitBox.new(2, 0, 20)
var testHitBox3 = RangedHitBox.new(5, 2, 0, 5, false, true, 0, 200, ['construction'])

func _init(position).(10, 10, 'res://TestBuild/icon.png'):
	get_node('sprite').modulate = Color(2, 2, 0)
	self.position = position
	attackRange = DetectionField.new(20)
	add_child(attackRange)
	attack = Attack.new(testHitBox3, 100, 100)
	add_child(attack)
	walkSpeed = 10
	health = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group('player')
	add_to_group('worker')
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
	
	targetActor = Game.closestNodeFromGroups(self, ['construction'])
	
	if targetActor:
		if attackRange.nodeInRange(targetActor):
			if not isAttacking and attack.usable:
				if Game.playerGold >= 2:
					Game.playerGold -= 2
					attack.start(self, targetActor)
			return

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
