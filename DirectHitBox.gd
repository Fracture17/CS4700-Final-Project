extends Node2D

#not even really a hitbox, just does damage to target after delay

class_name DirectHitBox

enum HitBoxTypes {
	PYSICAL,
	MAGIC,
	TRUE
}

var target: Actor
var damage: float
var type
var delay: float
var frameTimer = 0

func _init(damage: float, type, delay: float):
	self.damage = damage
	self.type = type
	self.delay = delay
	
func start(source, target):
	self.target = target

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	frameTimer += 0
	if frameTimer >= delay:
		return
	
	if is_instance_valid(target):
		target.getHit(self)
	queue_free()
	
func copy():
	return get_script().new(damage, type, delay)