class_name Tile
extends Area2D

"""
This should be edited so TileGrid controls all of the r,c coordinates.
"""

var tilesetID = 0
var tileID = 0
var type = 0
var r
var c
var pathable : bool
var isBase = false
var sprite
var collision
var text
var hover
var MENU

func _init(H, W, r, c):
	collision = Globals.newRectangleCollision(H-2, W-2)
	add_child(collision)
	
	global_position.x = c * (W) + W / 2 + 1
	global_position.y = r * (H) + H / 2
	self.r = r
	self.c = c

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group('tiles')
	pass
		
func _mouse_enter():
	hover()
	
func _mouse_exit():
	unhover()
		
func toggleType():
	type = (tileID + 1) % 3
	if type == 0:
		get_parent().addSquareAStar(r, c)
		get_parent().wallMap[r][c] = 1
	else:
		get_parent().removeSquareAStar(r, c)
		get_parent().wallMap[r][c] = 0
	
	get_parent().replace(r, c, type)
	
func updateSprite():
	pass
		
func hover():
	"""
	text = Label.new()
	get_parent().add_child(text)
	text.set_text("Row: " + str(r) + "\nCol: " + str(c))
	text.rect_position = Vector2(800, 20)
	"""
	sprite.modulate = Color(1.3, 1.3, 1.3, 1)
	hover = true
	
func unhover():
	"""
	text.queue_free()
	"""
	sprite.modulate = Color(1, 1, 1, 1)
	hover = false
	
func click():
	openMenu()
	
func isPathable():
	return pathable
	
# We put controls here to give env lower priority than UI
func _unhandled_input(event):
	if hover:
		if event is InputEventKey:
			if event.pressed and event.scancode == KEY_1:
				get_parent().replace(r,c,0)
			elif event.pressed and event.scancode == KEY_2:
				get_parent().replace(r,c,1)
			elif event.pressed and event.scancode == KEY_3:
				get_parent().replace(r,c,2)
			
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
			click()
			
func openMenu():
	if get_parent().activeMenu != null:
		get_parent().activeMenu.queue_free()
		
	var menuInst = MENU.instance()
	menuInst.setParent(r, c, tileID)
	menuInst.rect_position = self.global_position
	get_parent().add_child(menuInst)
	get_parent().activeMenu = menuInst