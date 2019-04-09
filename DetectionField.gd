extends Area2D

const LIGHT_NAME = 'light'
const COLLISION_NAME = 'collision'

var radius = 100
var color
var energy
var _type_ = 'DetectionField'

class_name DetectionField
	
func getNodesInRange():
	return get_overlapping_areas()
	
func filterNodesInRange(nodes):
	var result = []
	for node in nodes:
		if nodeInRange(node):
			result.append(node)
	return result
	
func nodeInRange(node):
	return overlaps_area(node)
	
func _init(radius):
	name = 'field'
	set_script(load('res://DetectionField.gd'))
	add_child(Globals.newCircleCollision(radius))
	add_child(Globals.newLight(radius))
	
func _ready():
	pass