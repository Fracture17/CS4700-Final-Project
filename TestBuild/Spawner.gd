extends Node2D

class_name Spawner

var rate
var time

func _init():
	rate = 2 # once per two seconds
	time = rate
	var sprite = Globals.newSprite(40, 40, "res://TestBuild/icon.png")
	sprite.modulate = Color(2, 0, 0)
	add_child(sprite)
	
func _ready():
	pass
	
func _process(delta):
	time -= delta
	if time <= 0:
		spawn()
		time = rate
		
func spawn():
	#spawn test enemy for now
	var E = BasicEnemy.new(self.global_position)
	Game.add_child(E)