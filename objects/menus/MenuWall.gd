extends Control

var r
var c
var t

func setParent(r, c, t):
	self.r = r
	self.c = c
	self.t = t

func _on_Destroy_pressed():
	get_parent().replace(r, c, 0)
	get_parent().activeMenu = null
	queue_free()

func _on_Cancel_pressed():
	get_parent().activeMenu = null
	queue_free()
