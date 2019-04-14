extends Node2D

class_name Spawner

var rate
var frameCounter = 0

func _init(rate, position):
	self.rate = rate
	self.position = position

func _ready():
	pass
	
func _process(delta):
	frameCounter += 1
	if frameCounter >= rate:
		spawn()
		frameCounter = 0
		
func spawn():
	#spawn test enemy for now
	var E = BasicEnemy.new(position)
	Game.add_child(E)