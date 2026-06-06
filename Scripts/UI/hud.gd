extends CanvasLayer




var selected_component: Dictionary = {"none": 0, "cockpit_1": 1, "cargo_1": 2, "fuel_1": 3, "rocket_1": 4}
var current_component: int
var placer
var credits: int
var component_cost: int
var component_instance: PackedScene
var cockpit_marker = Vector2(150.0,250.0)
var placer_active: bool = false
var is_placeable: bool
var placing_position: Vector2
@onready var weight_pb : ProgressBar = $PanelContainer/Static/VBoxContainer/Weight/weight_pb
@onready var quality_pb: ProgressBar = $PanelContainer/Accumulative/VBoxContainer/Quality/quality_pb
@onready var power_pb: ProgressBar = $PanelContainer/Static/VBoxContainer/Power/power_pb
@onready var lc_pb: ProgressBar = $PanelContainer/Static/VBoxContainer/Load_Cap/lc_pb
@onready var ts_pb: ProgressBar = $PanelContainer/Static/VBoxContainer/Trans_Speed/ts_pb
@onready var attack_pb: ProgressBar = $PanelContainer/Static/VBoxContainer/Attack/attack_pb
@onready var defense_pb: ProgressBar = $PanelContainer/Static/VBoxContainer/Defense/defense_pb
@onready var comfort_pb: ProgressBar = $PanelContainer/Accumulative/VBoxContainer/Comfort/comfort_pb
@onready var maneuverability_pb: ProgressBar = $PanelContainer/Accumulative/VBoxContainer/Maneuverability/manuever_pb
@onready var efficiency_pb: ProgressBar = $PanelContainer/Accumulative/VBoxContainer/Efficiency/efficiency_pb
@onready var money: Label = $Finances/HBoxContainer/Money
@onready var balance: Label = $Finances/HBoxContainer/Balance
@onready var time: ProgressBar = $BottomUIBar/HBoxContainer/VBoxContainer/TimeProgress


var current_time_string: String = "%s/%s"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventCall.connect("pressed", _component_button_pressed)
	EventCall.connect("placement",_place_component)
	EventCall.connect("stats_changed",_stats_display)
	WorldState.connect("tick", _tick)
	credits = 100000
	money.text = "Money" + str(credits)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	$Label.text = "Current Component: " + str(current_component)
	if is_instance_valid(placer):
		placer.position = mouse_pos
		
	if time.value >= 1000.0:
		WorldState.tick.emit()
	
		
func _physics_process(delta: float) -> void:
	time.value += WorldState.time_progress
	
				
func _component_button_pressed(component: ComponentManager):
	if is_instance_valid(placer):
		_delete_placement_visualizer()
	for i in selected_component:
		if component.number == selected_component[i]:
			current_component = selected_component[i]
			component_instance = component.component
			component_cost = component.price
			_create_placement_visualizer(component.visual)
		else:
			print("false")
	if current_component == 1:
		is_placeable = true
		_place_component(component_instance,is_placeable, cockpit_marker)
		is_placeable = false
		_delete_placement_visualizer()
			
			
func _unhandled_input(event: InputEvent) -> void:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				if placer_active and is_placeable == true:
					_place_component(component_instance,is_placeable, placing_position)
					
func _tick():
	time.value = 0
	$BottomUIBar/HBoxContainer/VBoxContainer/CurrentTime.text = current_time_string % ["%0*d" % [2, WorldState.month], WorldState.year]

func _create_placement_visualizer(visual: CompressedTexture2D):
	placer = Sprite2D.new()
	add_child(placer)
	placer.texture = visual
	placer.modulate.a = .525
	placer_active = true
	
func _delete_placement_visualizer():
	placer.free()
	placer_active = false
	
func _place_component(comp_inst:PackedScene,plce: bool, position: Vector2):
	is_placeable = plce
	placing_position = position
	if is_instance_valid(comp_inst) and is_placeable == true:
		var place = comp_inst.instantiate()
		place.global_position = position
		EventCall.clear_call.emit()
		owner.add_child(place)
		_finances_changed(component_cost)
		
func _stats_display(stats: StatsCalculation):
	print("called")
	weight_pb.value = stats.weight
	quality_pb.value = stats.quality
	power_pb.value = stats.power
	lc_pb.value = stats.load_capacity
	ts_pb.value = stats.transport_speed
	efficiency_pb.value = stats.efficiency
	maneuverability_pb.value = stats.maneuverability
	comfort_pb.value = stats.comfort
	
func _finances_changed(cost: int):
	credits -= cost
	money.text = "Money" + str(credits)

func _on_pause_button_pressed() -> void:
	WorldState.time_progress = 0

func _on_1x_button_pressed() -> void:
	WorldState.time_progress = 2

func _on_2x_button_pressed() -> void:
	WorldState.time_progress = 4

func _on_5x_button_pressed() -> void:
	WorldState.time_progress = 10

func _on_build_button_pressed() -> void:
	$BottomUIBar.hide()
	$TabContainer.show()
	$PanelContainer.show()
	WorldState.time_progress = 0
