extends Node

func _ready():
	pass

""" 	loadSaveData takes the name of a save file, and loads the
		contents stored inside if any. 
		Return true if successful, and false on fail condition:
			(unreadable, bad format, does not exist, etc)
			
		Arguments
		filepath - string containing the path to savefile
"""
func loadSaveData(filepath = "default"):
	pass
	
""" 	writeSaveData takes the values stored in memory and writes it
		to a file
"""
func writeSaveData():
	pass
	
