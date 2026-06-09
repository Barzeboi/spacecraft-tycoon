extends Node

signal tick

var month: int = 1
var year: int = 2240
var time_progress: int
var time_speed: int = 1
var base_customer_base: int = 250000
var customer_base : float
var customer_fluc
var world_economy: float = 1.0
var player_id = 1

func _ready() -> void:
	connect("tick", _tick)
	
func _process(delta: float) -> void:
	if time_progress >= 1000:
		tick.emit()
		
func _physics_process(delta: float) -> void:
	time_progress += time_speed

func _tick():
	month += 1
	time_progress = 0
	if month >= 13:
		
		month = 1
		year += 1
		_year_tick()
		
func _year_tick():
	customer_base = base_customer_base - (base_customer_base * randf_range(-.05, .05))
	print(customer_base)
