extends Node2D

var source: Actor
var hitbox
var actionableFrame: int
var rechargeFrames: int
var frameCounter: int = 0
var usable: bool = true
var active: bool

class_name Attack

enum HitBoxTypes {
	PYSICAL,
	MAGIC,
	TRUE
}

#signal attackActionable

func _init(hitbox, actionableFrame, rechargeFrames):
	self.hitbox = hitbox
	self.actionableFrame = actionableFrame
	self.rechargeFrames = rechargeFrames

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(source, target = null):
	active = true
	self.source = source
	frameCounter = 0
	usable = false
	var H = hitbox.copy()
	H.start(source, target)
	add_child(H)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not active:
		return
	
	if source.isAttacking and frameCounter >= actionableFrame:
		source.isAttacking = false
		
	if not usable and frameCounter >= rechargeFrames:
		usable = true
		
	frameCounter += 1
#	pass