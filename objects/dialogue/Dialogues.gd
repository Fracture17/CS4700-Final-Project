class_name Dialogues extends Node

var TutorialText

func _ready():
	TutorialText = DialogueText.new()
	TutorialText.dialogue_index = 0
	TutorialText.setContent([
		[image.PORTRAIT_TEST_1,"Person A","I have to do things A, B, and C"],
		[image.PORTRAIT_TEST_2,"Person B","Good luck with those things"],
		[image.PORTRAIT_TEST_1,"Person A","What about you?"],
		[image.PORTRAIT_TEST_2,"Person B","Yes"]
	])