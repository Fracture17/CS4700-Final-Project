extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var b = PlayerBase.new()
	b.position = Vector2(150, 300)
	add_child(b)
	
	var s = Spawner.new(5)
	s.position = Vector2(850, 100)
	add_child(s)
	
	s = Spawner.new(5)
	s.position = Vector2(850, 280)
	add_child(s)
	
	s = Spawner.new(5)
	s.position = Vector2(850, 450)
	add_child(s)
	
	b = Fighter.new(Vector2(200, 300))
	add_child(b)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node('Label').text = 'Gold: ' + str(Game.playerGold)
#	pass
