class_name TileBasePlayer extends TileStructure

func _init(H, W, r, c).(H, W, r, c):
	tileID = 4
	print("new player base")
	struct = PlayerBase.new()
	add_child(struct)
	struct.global_position = self.global_position