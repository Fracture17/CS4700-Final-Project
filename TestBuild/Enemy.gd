extends MovingActor

class_name Enemy

var gold = 1



func _init(height, width, spritePath = '').(height, width, spritePath):
	pass

func _ready() -> void:
	add_to_group('enemy')
	pass # Replace with function body.

func die():
	Game.playerGold += gold
	.die()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
