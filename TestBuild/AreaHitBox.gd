extends DetectionField

class_name AreaHitBox

enum HitBoxTypes {
	PYSICAL,
	MAGIC,
	TRUE
}

var source: Actor
var target: Actor
var radius
var damage: float
var type
var startOffset: Vector2
var singleHit: bool
var delay: float
var duration: float
var targetGroups: Array

func _init(radius: float, damage: float, type, startOffset: Vector2, singleHit: bool,
				delay: float, duration: float, targetGroups: Array).(radius):
	self.radius = radius
	self.damage = damage
	self.type = type
	self.startOffset = startOffset
	self.singleHit = singleHit
	self.delay = delay
	self.duration = duration
	self.targetGroups = targetGroups
	
func start(source, target = null):
	self.source = source
	self.target = target
	
	if singleHit:
		connect('area_entered', self, 'collide')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if target != null:
		look_at(target.position - position)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	delay -= 1
	if delay >= 0:
		return
	
	visible = true
	
	duration -= 1
	if duration <= 0:
		Globals.deleteNode(self)
		return
	
	if not singleHit:
		for node in getNodesInRange():
			collide(node)
				
	if position.x < -1000 or position.x > 2000 or position.y < -1000 or position.y > 2000:
		Globals.deleteNode(self)
#	pass

func collide(node):
	if isTarget(node):
		node.getHit(self)
		return true
	return false
	
func isTarget(node):
	return node != source and len(Globals.arrayIntersection(targetGroups, node.get_groups())) > 0
	
func copy():
	return get_script().new(radius, damage, type, startOffset, singleHit, delay, duration, targetGroups)
	