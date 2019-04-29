class_name DialogueText extends Node

var portrait_text
var body_text
var portrait
var dialogue_position = 0
var camera_position
var dialogue_index

var content = [
	[]
]

func step():
	if dialogue_position < content.size()-1:
		dialogue_position += 1
		portrait = content[dialogue_position][0]
		portrait_text = content[dialogue_position][1]
		body_text = content[dialogue_position][2]
		return true
	else:
		dialogue_position = 0
		portrait = content[dialogue_position][0]
		portrait_text = content[dialogue_position][1]
		body_text = content[dialogue_position][2]
		
		global.dialogues[dialogue_index] = 1
		global.writeSaveData()
		return false
		
func setContent(c):
	content = c
	dialogue_position = 0
	portrait = content[dialogue_position][0]
	portrait_text = content[dialogue_position][1]
	body_text = content[dialogue_position][2]
	