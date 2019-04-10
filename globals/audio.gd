extends Node

var DB = -20

# TODO: Enable volume adjustment
# Create using audio.DespawningAudio.new(sound)
class DespawningAudio extends AudioStreamPlayer:
	
	var sound_timer
	
	func _init(sound):
		self.stream = load(sound)
		sound_timer = self.stream.get_length()
		
	func _ready():
		connect('finished', self, 'done')
		self.play()
		self.volume_db = audio.DB
		
	func done():
		queue_free()
		
	# figure out signal for sound adjustment later
	#
	
func setVolume(db):
	self.DB = db
	for child in get_children():
		child.volume_db = db
		
func play(sound):
	var DA = DespawningAudio.new(sound)
	add_child(DA)