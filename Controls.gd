extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var selected = []
var isMakingTower = false

func _unhandled_key_input(event: InputEventKey) -> void:
	if event.pressed and not event.is_echo() and event.scancode == KEY_S:
		var nodes = Globals.getAllNodesInGroups(['playerBase', 'tower'])
		for node in nodes:
			var S = ClickSpawnField.new(node.position, 50)
			Game.add_child(S)
	if event.pressed and not event.is_echo() and event.scancode == KEY_T:
		isMakingTower = !isMakingTower
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if isMakingTower:
			isMakingTower = false
			var T = Construction.new()
			T.position = event.position
			Game.add_child(T)
		elif len(selected) == 0:
			var F
			if Input.is_key_pressed(KEY_A):
				F = Game.F2
			else:
				F = Game.F1
			F.visible = true
			F.time = .1
			for node in F.getNodesInRange():
				if 'player' in node.get_groups():
					node.isSelected = true
					selected.append(node)
		else:
			for node in selected:
				if is_instance_valid(node):
					node.dest = event.position
					node.isSelected = false
			selected = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
