extends Actor

class_name Spawner

var rate
var time

func _init(rate = 2).(40, 40, "res://TestBuild/icon.png"):
	self.rate = rate # once per two seconds
	time = rate
	var sprite = get_node('sprite')
	sprite.modulate = Color(2, 0, 0)
	add_child(sprite)
	health = 20
	
func _ready():
	add_to_group('spawner')
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