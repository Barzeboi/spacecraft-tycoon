extends Node
class_name StatsCalculation

var weight: int
var accum_quality: float
var quality: float
var accum_efficiency: float
var efficiency: float
var power: float
var accum_maneuverability: float
var maneuverability: float
var load_capacity: int
var transport_speed: float
var accum_comfort: float
var comfort: float
var attack: float
var defense: float
var sheilding: float
var fuel: int

var previous_stats: Array[Variant]

var count: int
var eff_count: int
var man_count: int
var com_count: int


func _ready() -> void:
	EventCall.connect('stats_call', _stats_addition)
	
	
func _stats_addition(stats:ComponentStats):
	weight += stats.weight
	accum_quality += stats.quality
	accum_efficiency += stats.efficiency
	power += stats.power
	accum_maneuverability += stats.maneuverability
	load_capacity += stats.load_capacity
	transport_speed += stats.transport_speed
	accum_comfort += stats.comfort
	attack += stats.attack
	defense += stats.defense
	sheilding += stats.defense
	fuel += stats.fuel
	
	
	if stats.efficiency > 0.0:
		eff_count += 1
	if stats.maneuverability > 0.0:
		man_count += 1.0
	if stats.comfort > 0.0:
		com_count += 1.0
		
	_stats_modifiers()
	print(transport_speed)
	
	
func _stats_modifiers():
	count += 1
	weight = weight + (load_capacity * 0.25) + (fuel * 0.4)
	accum_maneuverability = accum_maneuverability - (weight * 0.15)
	transport_speed = (transport_speed - (weight * 0.0001)) * (efficiency/100)
	comfort = (comfort * (quality)) - (load_capacity)

	quality = (accum_quality / count)
	efficiency = (accum_efficiency / eff_count)
	maneuverability = (accum_maneuverability / man_count)
	comfort = (accum_comfort / com_count)
	EventCall.emit_signal("script_changed", self)
