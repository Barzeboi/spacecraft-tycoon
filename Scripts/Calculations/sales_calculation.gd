extends WorldState
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

var preferred_demographic: BuyerDemographics = BuyerDemographics.NONE
var weight_importance: int
var attack_importance: int
var defense_importance: int
var maneuverability_importance: int
var load_cap_importance: int
var transport_speed_importance: int
var comfort_importance: int
var shield_importance: int
var fuel_importance: int

var weight_max: float = 10000000
var efficiency_max: float = 100
var load_capacity_max: float = 10000
var transport_speed_max: float = 20000
var maneuverability_max: float = 100
var comfort_max: float = 100
var attack_max: float = 100
var defense_max: float = 100
var shielding_max: float = 100
var fuel_max: float = 100

var sales_score: float
var marketing: float
var price: int
var sales_amount

func _ready() -> void:
	pass

func _get_buyer_demographics():
	match preferred_demographic:
		BuyerDemographics.TRANSPORTERS:
			weight_importance = 90
			attack_importance = 5
			defense_importance = 30
			maneuverability_importance = 80
			load_cap_importance = 25
			transport_speed_importance = 70
			comfort_importance = 60
			shield_importance = 40
			fuel_importance = 50
		BuyerDemographics.ESCORTS:
			weight_importance = 80
			attack_importance = 55
			defense_importance = 10
			maneuverability_importance = 90
			load_cap_importance = 10
			transport_speed_importance = 60
			comfort_importance = 20
			shield_importance = 80
			fuel_importance = 45
		BuyerDemographics.MERCHANTS:
			weight_importance = 25
			attack_importance = 5
			defense_importance = 50
			maneuverability_importance = 40
			load_cap_importance = 70
			transport_speed_importance = 30
			comfort_importance = 20
			shield_importance = 70
			fuel_importance = 80
		BuyerDemographics.PIRATE_HUNTERS:
			weight_importance = 75
			attack_importance = 80
			defense_importance = 30
			maneuverability_importance = 40
			load_cap_importance = 70
			transport_speed_importance = 55
			comfort_importance = 35
			shield_importance = 45
			fuel_importance = 55
		BuyerDemographics.LUXURY_TRANSPORTERS:
			weight_importance = 100
			attack_importance = 5
			defense_importance = 25
			maneuverability_importance = 60
			load_cap_importance = 20
			transport_speed_importance = 85
			comfort_importance = 100
			shield_importance = 30
			fuel_importance = 65
		BuyerDemographics.MERCENARIES:
			weight_importance = 30
			attack_importance = 100
			defense_importance = 45
			maneuverability_importance = 45
			load_cap_importance = 20
			transport_speed_importance = 60
			comfort_importance = 15
			shield_importance = 90
			fuel_importance = 60
		BuyerDemographics.BULK_TRADERS:
			weight_importance = 10
			attack_importance = 20
			defense_importance = 65
			maneuverability_importance = 5
			load_cap_importance = 100
			transport_speed_importance = 25
			comfort_importance = 5
			shield_importance = 60
			fuel_importance = 95
		BuyerDemographics.WORLD_SHIP_DWELLERS:
			weight_importance = 0
			attack_importance = 50
			defense_importance = 100
			maneuverability_importance = 5
			load_cap_importance = 100
			transport_speed_importance = 5
			comfort_importance = 75
			shield_importance = 100
			fuel_importance = 90

func _sales_score_calcalulations(stats: StatsCalculation):
	sales_score += (stats.attack/ attack_max) * (1+(attack_importance/100))
	sales_score += (stats.defense/ defense_max) * (1+(defense_importance/100))
	sales_score += (stats.load_capacity/ load_capacity_max) * (1+(defense_importance/100))
	sales_score += (stats.weight/ weight_max) * (1-(weight_importance/100))
	sales_score += (stats.transport_speed/ transport_speed_max) * (1+(transport_speed_importance/100))
	sales_score += (stats.maneuverability/ maneuverability_max) * (1+(maneuverability_importance/100))
	sales_score += (stats.shielding/ shielding_max) * (1+(shield_importance/100))
	sales_score += (stats.fuel/ fuel_max) * (1+(fuel_importance/100))
	EventCall.emit_signal("send_score", sales_score)
	_sales_calculation(sales_score)
	
func demographics_distribution():
	pass

func _sales_calculation(sales_score: int):
	sales_amount = randi_range(2, 10) + (sales_score/1000)
	

func _tick():
	pass
