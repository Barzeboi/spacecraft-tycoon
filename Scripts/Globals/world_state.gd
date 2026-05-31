extends Node

signal tick

var month: int = 1
var year: int = 2240
var time_progress: int = 1
var base_customer_base: int = 50000
var customer_base : int
var world_economy: float = 1.0

func _ready() -> void:
	connect("tick", _tick)
	
func _process(delta: float) -> void:
	pass
	

func _tick():
	month += 1
	if month >= 13:
		
		month = 1
		year += 1
		_year_tick()
		
func _year_tick():
	customer_base = base_customer_base - (base_customer_base * randf_range(-.05, .05))
	print(customer_base)
