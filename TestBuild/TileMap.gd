extends TileMap

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var i = 0
	for pos in get_used_cells():
		if get_cell(pos.x, pos.y) == 1:
			pos = (map_to_world(pos) + Vector2(11, 11)) * 2
			Game.addSquareAStar(i, pos.x, pos.y)
		i += 1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
