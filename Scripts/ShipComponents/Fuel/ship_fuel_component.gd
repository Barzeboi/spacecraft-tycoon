extends ShipComponent


func _ready() -> void:
	EventCall.emit_signal("stats_call", component_stats)
