extends Area2D

class_name DetectionField

var _type_ = 'DetectionField'

	
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
	visible = false
	name = 'field'
	add_child(Globals.newCircleCollision(radius))
	add_child(Globals.newLight(radius))
	
func _ready():
	pass
