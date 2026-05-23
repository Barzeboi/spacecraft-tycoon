extends Node
class_name StatsCalculation


var base_transport_speed: float
var base_comfort: float
var base_weight: float
var base_accum_maneuverability: float

var weight: float
var accum_quality: float
var quality: float
var accum_efficiency: float
var efficiency: float = 0.0
var power: float
var accum_maneuverability: float
var maneuverability: float
var load_capacity: int
var transport_speed: float = 0.0
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
	base_weight += stats.weight
	accum_quality += stats.quality
	accum_efficiency += stats.efficiency
	power += stats.power
	base_accum_maneuverability += stats.maneuverability
	load_capacity += stats.load_capacity
	base_transport_speed += stats.transport_speed
	accum_comfort += stats.comfort
	attack += stats.attack
	defense += stats.defense
	sheilding += stats.defense
	fuel += stats.fuel
	
	
	if stats.efficiency > 0.0:
		eff_count += 1
	if stats.maneuverability > 0.0:
		man_count += 1
	if stats.comfort > 0.0:
		com_count += 1
		
	_stats_modifiers()

	
	
func _stats_modifiers():
	count += 1
	
	quality = (accum_quality / count)
	efficiency = (accum_efficiency / eff_count)
	base_comfort = (accum_comfort / com_count)
	
	weight = weight + (load_capacity * 0.25) + (fuel * 0.4)
	accum_maneuverability = base_accum_maneuverability - (weight * 0.15)
	transport_speed = (base_transport_speed - (weight * 0.02)) * (efficiency/100)
	comfort = (base_comfort * (quality)) - (load_capacity)

	maneuverability = (accum_maneuverability / man_count)
	
	print("efficiency: " + str(efficiency))
	print("transport_speed: " + str(transport_speed))
	
	EventCall.emit_signal("script_changed", self)
