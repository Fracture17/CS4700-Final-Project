class_name TileStructure extends TileFloor

var hp = 20
var targetable = true

var structureSprite

func _init(H, W, r, c).(H, W, r, c):
	structureSprite = Globals.newSprite(H, W, "res://assets/images/TILESET_TEST/0-1-0.png")