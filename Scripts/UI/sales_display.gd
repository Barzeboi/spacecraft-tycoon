extends Control



var ships_holder: Array = []


func _ready() -> void:
	EventCall.connect("info_send", _make_ship_array)

func _make_ship_array(ship_name: String, price: int, sales_score: int):
	ships_holder.append([ship_name,price,sales_score])
	EventCall.array_finished.emit()
	print("done")
	
	
