class_name HealthComponent
extends Node

signal damaged(health_lost)
signal repairing(health_gained)

@export var hull_health: float = 500.0



func _hit(damage: float):
	pass
