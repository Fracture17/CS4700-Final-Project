extends DetectionField

class_name ClickSpawnField

func _init(position, radius).(radius):
	self.position = position

func _ready():
	visible = true
	connect('input_event', self, 'clicked')

func clicked( viewport, event, shapeidx ):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if Game.playerGold >= 5:
			Game.playerGold -= 5
			if Input.is_key_pressed(KEY_W):
				var E = Worker.new(event.global_position)
				Game.add_child(E)
			else:
				var E = Fighter.new(event.global_position)
				Game.add_child(E)
			queue_free()
	
func _unhandled_key_input(event: InputEventKey) -> void:
	if event.pressed and not event.is_echo() and event.scancode == KEY_D:
		queue_free()