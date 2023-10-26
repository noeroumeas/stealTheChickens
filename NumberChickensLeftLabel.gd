extends Label

var chickensLeft
var deletedChickens = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_chicken_catched(chicken):
	if(is_chicken_already_deleted(chicken)):
		return;
	chickensLeft = chickensLeft - 1
	set_chicken_number(chickensLeft)
	deletedChickens.append(chicken)
	
func set_chicken_number(number):
	chickensLeft = number
	text = "Chickens left : %s" % number

func is_chicken_already_deleted(chicken):
	return deletedChickens.find(chicken) != -1
