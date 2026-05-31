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

var preffered_demographic: BuyerDemographics = BuyerDemographics.NONE
var quaility_importance: int
var attack_importance: int
var maneuverability_importance: int
var load_cap_importance: int
var transport_speed_importance: int
var comfort_importance: int
var sheild_importance: int
var fuel_importance: int


func _get_buyer_demographics():
	match preffered_demographic:
		BuyerDemographics.TRANSPORTERS:
			quaility_importance = 45
			attack_importance = 5
			maneuverability_importance = 80
			load_cap_importance = 25
			comfort_importance = 60
			sheild_importance = 40
			fuel_importance = 50
		BuyerDemographics.ESCORTS:
			pass
		BuyerDemographics.MERCHANTS:
			pass
		BuyerDemographics.PIRATE_HUNTERS:
			pass
		BuyerDemographics.LUXURY_TRANSPORTERS:
			pass
		BuyerDemographics.MERCENARIES:
			pass
		BuyerDemographics.BULK_TRADERS:
			pass
		BuyerDemographics.WORLD_SHIP_DWELLERS:
			pass


func _sales_calcalulations():
	pass
