extends DetectionField

class_name MouseDetection

var time = .1

func _init(radius).(radius):
	pass

func _ready():
	pass

func _process(delta):
	position = get_viewport().get_mouse_position()
	if time > 0:
		time -= delta
	else:
		visible = false