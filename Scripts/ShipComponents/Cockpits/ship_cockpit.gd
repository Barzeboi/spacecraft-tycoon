extends ShipComponent


@export var ship_overall: ShipOverall = ShipOverall.new()


func _ready() -> void:
	EventCall.emit_signal('stats_call', component_stats)
