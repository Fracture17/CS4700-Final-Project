extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.playerGold = 0
	add_child(BasicEnemy.new())
	add_child(PlayerBase.new())
	#add_child(Spawner.new(60))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
