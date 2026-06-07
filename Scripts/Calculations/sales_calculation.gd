extends Node
class_name SalesCalculation

enum BuyerDemographics
{
	NONE,
	TRANSPORTERS,
	ESCORTS,
	MERCHANTS,
	PIRATE_HUNTERS,
	LUXURY_TRANSPORTERS,
	MERCENARIES,
	BULK_TRADERS,
	WORLD_SHIP_DWELLERS
}

@export var stats_calculation: StatsCalculation
var preferred_demographic: BuyerDemographics = BuyerDemographics.NONE
var attack_importance: int
var defense_importance: int
var maneuverability_importance: int
var load_cap_importance: int
var transport_speed_importance: int
var comfort_importance: int
var sheild_importance: int
var fuel_importance: int

var weigh_max: float = 10000000
var efficiency_max: float = 100
var load_capacity_max: float = 10000
var transport_speed_max: float = 20000
var comfort_max: float = 100
var attack_max: float = 100
var defense_max: float = 100
var shielding_max: float = 100
var fuel_max: float = 100

var sales_score: float

func _ready() -> void:
	pass

func _get_buyer_demographics():
	match preferred_demographic:
		BuyerDemographics.TRANSPORTERS:
			attack_importance = 5
			defense_importance = 30
			maneuverability_importance = 80
			load_cap_importance = 25
			transport_speed_importance = 70
			comfort_importance = 60
			sheild_importance = 40
			fuel_importance = 50
			
		BuyerDemographics.ESCORTS:
			attack_importance = 55
			defense_importance = 10
			maneuverability_importance = 90
			load_cap_importance = 10
			transport_speed_importance = 60
			comfort_importance = 20
			sheild_importance = 80
			fuel_importance = 45
		BuyerDemographics.MERCHANTS:
			attack_importance = 5
			defense_importance = 50
			maneuverability_importance = 40
			load_cap_importance = 70
			transport_speed_importance = 30
			comfort_importance = 20
			sheild_importance = 70
			fuel_importance = 80
		BuyerDemographics.PIRATE_HUNTERS:
			attack_importance = 80
			defense_importance = 30
			maneuverability_importance = 40
			load_cap_importance = 70
			transport_speed_importance = 55
			comfort_importance = 35
			sheild_importance = 45
			fuel_importance = 55
		BuyerDemographics.LUXURY_TRANSPORTERS:
			attack_importance = 5
			defense_importance = 25
			maneuverability_importance = 60
			load_cap_importance = 20
			transport_speed_importance = 85
			comfort_importance = 100
			sheild_importance = 30
			fuel_importance = 65
		BuyerDemographics.MERCENARIES:
			attack_importance = 100
			defense_importance = 45
			maneuverability_importance = 45
			load_cap_importance = 20
			transport_speed_importance = 60
			comfort_importance = 15
			sheild_importance = 90
			fuel_importance = 60
		BuyerDemographics.BULK_TRADERS:
			attack_importance = 20
			defense_importance = 65
			maneuverability_importance = 5
			load_cap_importance = 100
			transport_speed_importance = 25
			comfort_importance = 5
			sheild_importance = 60
			fuel_importance = 95
		BuyerDemographics.WORLD_SHIP_DWELLERS:
			attack_importance = 50
			defense_importance = 100
			maneuverability_importance = 5
			load_cap_importance = 100
			transport_speed_importance = 5
			comfort_importance = 75
			sheild_importance = 100
			fuel_importance = 90


func _sales_calcalulations():
	pass
	
func demographics_distribution():
	pass
