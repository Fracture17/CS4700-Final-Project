class_name TileTower extends TileStructure


func _init(H, W, r, c).(H, W, r, c):
	MENU = preload("res://objects/menus/MenuWall.tscn")
	tileID = 5
	print("new spawner")
	struct = BasicTower.new(self.global_position)
	add_child(struct)
	struct.global_position = self.global_position
	
func updateSprite():
	pass