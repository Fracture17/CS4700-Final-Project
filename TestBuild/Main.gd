extends Node2D

func _ready() -> void:
	Game.playerGold = 0
	
	#add_child(Spawner.new(100, Vector2(100, 100)))
	#add_child(Spawner.new(100, Vector2(600, 100)))
	#add_child(Spawner.new(100, Vector2(100, 600)))
	#add_child(Spawner.new(100, Vector2(600, 600)))
	
	#add_child(BasicTower.new(Vector2(300, 300)))
	#add_child(BasicTower.new(Vector2(400, 500)))
	#add_child(BasicTower.new(Vector2(300, 500)))
	#add_child(BasicTower.new(Vector2(500, 400)))
	
	#add_child(PlayerBase.new())
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
