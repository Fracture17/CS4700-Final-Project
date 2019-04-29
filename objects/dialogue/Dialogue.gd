class_name Dialogue extends Control

var portrait
var portrait_text
var body_text

var dialogue

func _ready():
	portrait_text = get_child(0).get_child(0)
	body_text = get_child(0).get_child(1)
	portrait = get_child(1)	
	
	portrait_text.text = dialogue.portrait_text
	body_text.text = dialogue.body_text
	portrait.texture = dialogue.portrait

func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		print("input captured by control")
		next()
		
func next():
	if dialogue.step():
		portrait_text.text = dialogue.portrait_text
		body_text.text = dialogue.body_text
		portrait.texture = dialogue.portrait
	else:
		queue_free()