extends Node2D

var UpgradesButton
var EquipmentButton

var missionLocX = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200]
var missionLocY = [100, 200, 100, 400, 200, 600, 200, 100, 300, 200, 200, 100]

# Called when the node enters the scene tree for the first time.
func _ready():
	UpgradesButton = get_child(0)
	EquipmentButton = get_child(1)
	
	# If Upgrades hasn't been unlocked
	#if global.missionUnlocked[1] == 0:
	#	UpgradesButton.disabled = true
	
	# If Equipment hasn't been unlocked
	#if global.missionUnlocked[2] == 0:
	#	EquipmentButton.disabled = true
	
	for i in range(global.missionUnlocked.size()):
		if global.missionUnlocked[i] == 1:
			print(i)
			var flag = Flag.new(i)
			flag.global_position = Vector2(missionLocX[i], missionLocY[i])
			get_parent().add_child(flag)
		else:
			break

class Flag extends Area2D:
	
	var level
	var sprite
	var collision
	var text
	var hovering
	
	func _init(level):
		self.level = level
		self.input_pickable = true
		
		sprite = Globals.newSprite(50, 50, "res://TestBuild/icon.png")
		add_child(sprite)
	
		collision = Globals.newRectangleCollision(50, 50)
		add_child(collision)
	
	func _ready():
		pass 
		
	func _mouse_enter():
		hover()
		
	func _mouse_exit():
		unhover()

	func hover():
		
		text = Label.new()
		get_parent().add_child(text)
		text.set_text("Row: " + str(global_position.x) + "\nCol: " + str(global_position.y))
		text.rect_position = Vector2(800, 20)
		
		sprite.modulate = Color(1.3, 1.3, 1.3, 1)
		hovering = true
		
	func unhover():
		text.queue_free()
		
		sprite.modulate = Color(1, 1, 1, 1)
		hovering = false
		
	func _on_Area2D_input_event( viewport, event, shape_idx ):
	    if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
	        print("Clicked")
			
class FlagHoverObject extends Sprite:
	
	func _ready():
		pass
		
