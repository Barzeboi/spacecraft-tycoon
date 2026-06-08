extends Resource
class_name ShipOverall


var sales_score: int
var name: String
var price: int

func _ready():
	EventCall.connect("send_score", _get_score)
	

func _get_score(s: int):
	sales_score = s
