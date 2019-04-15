class_name TileSpawner extends TileStructure

func _init(H, W, r, c).(H, W, r, c):
	tileID = 3
	print("new spawner")
	struct = Spawner.new()
	add_child(struct)
	struct.global_position = self.global_position