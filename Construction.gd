extends Actor

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

class_name Construction

func _init().(50, 50, 'res://TestBuild/icon.png'):
	health = 1
	var sprite = get_node('sprite')
	sprite.modulate = Color(1, 1, 1, 0.5)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group('construction')
	pass # Replace with function body.

func die():
	.die()
	get_parent().add_child(BasicTower.new(position))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
