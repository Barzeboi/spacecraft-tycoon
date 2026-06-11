extends Resource
class_name ShipOverall


var sales_score: int = 0
var name: String
var price: int = 0

func _ready():
	EventCall.connect("score_gather", _get_info)
	EventCall.connect("info_gather", _get_info)
	

func _get_info(n: String, p: int, s: int):
	sales_score = s
	name = n
	price = p
	
	if n != null && p != 0 && s != 0:
		_send_info()
	
func _send_info():
	EventCall.emit_signal("info_send", name, price, sales_score)
