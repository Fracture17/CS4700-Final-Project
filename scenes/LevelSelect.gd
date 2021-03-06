extends Node2D

var UpgradesButton
var EquipmentButton

var missionLocX = [200, 400, 700, 900, 1200, 600, 180, 500, 720, 900, 1160, 1290]
var missionLocY = [168, 218, 225, 330, 68, 398, 623, 668, 738, 723, 680, 520]

var flags = []

var DialogueBox = preload("res://objects/dialogue/Dialogue.tscn")

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
			var flag = Flag.new(i)
			flag.global_position = Vector2(missionLocX[i], missionLocY[i])
			get_parent().add_child(flag)
			flags.append(flag)
		else:
			break

	if global.dialogues[0] == 1:
		var d = DialogueBox.instance()
		d.dialogue = Dialogues.TutorialText
		add_child(d)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_R:
				print("Adding mission")
				for i in range(global.missionUnlocked.size()):
					if global.missionUnlocked[i] == 0:
						global.missionUnlocked[i] = 1
						var flag = Flag.new(i)
						flag.global_position = Vector2(missionLocX[i], missionLocY[i])
						get_parent().add_child(flag)
						flags.append(flag)
						print(global.missionUnlocked)
						break
			if event.scancode == KEY_E:
				print("Removing mission")
				for i in range(global.missionUnlocked.size()):
					if global.missionUnlocked[global.missionUnlocked.size()-1-i] == 1:
						global.missionUnlocked[global.missionUnlocked.size()-1-i] = 0
						print(global.missionUnlocked)
						flags[flags.size()-1].queue_free()
						flags.remove(flags.size()-1)
						break

class Flag extends Area2D:
	
	var level
	var sprite
	var collision
	var text
	var hovering
	var timer
	
	func _init(level):
		self.level = level
		self.input_pickable = true
		
		timer = 1/12
		sprite = Sprite.new()
		sprite.texture = image.FLAG
		sprite.vframes = 1
		sprite.hframes = 4
		sprite.frame = randi()%4
		add_child(sprite)
	
		collision = Globals.newRectangleCollision(96, 96)
		add_child(collision)
	
	func _ready():
		pass 
		
	func _mouse_enter():
		hover()
		
	func _mouse_exit():
		unhover()

	func _process(delta):
		timer -= delta
		if timer < 0:
			timer = .125
			sprite.frame = (sprite.frame + 1) % 4

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
		
	
	func _unhandled_input(event):
		if event is InputEventKey:
			if event.pressed and event.scancode == KEY_P:
				print("Level: " + str(level))
				get_tree().change_scene(global.stages[level])
			
class FlagHoverObject extends Sprite:
	
	func _ready():
		pass
		
