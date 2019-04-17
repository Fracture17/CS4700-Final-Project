extends Actor

class_name MovingActor

var walkSpeed
var dest

func _init(height, width, spritePath = '').(height, width, spritePath):
	pass

func _ready():
	pass
	
#moves towards destination using walkspeed.  Returns true if reached
func moveTowards(destination):
	var velocity = Game.navigate(self, destination, walkSpeed)
	translate(velocity)
	return velocity == Vector2(0,0)