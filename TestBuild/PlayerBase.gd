extends Tower

class_name PlayerBase

const HIEGHT = 50
const WIDTH = 50
const SPRITE = 'res://TestBuild/icon.png'

func _init().(HIEGHT, WIDTH, SPRITE):
	pass

func _ready():
	add_to_group('base')
	add_to_group('playerBase')
	pass