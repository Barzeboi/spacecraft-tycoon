extends CanvasLayer

var selected_component = {"none": 0, "cockpit_1": 1, "cargo_1": 2, "fuel_1": 3, "rocket_1": 4}
var current_component: int
var placer
var component_instance: PackedScene
var cockpit_marker = Vector2(150.0,250.0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventCall.connect("pressed", _button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	$Label.text = "Current Component: " + str(current_component)
	if is_instance_valid(placer):
		placer.position = mouse_pos
				
func _button_pressed(component_num: int, component_inst: PackedScene, component_img: CompressedTexture2D):
	if is_instance_valid(placer):
		_delete_placement_visualizer()
	for i in selected_component:
		if component_num == selected_component[i]:
			current_component = selected_component[i]
			component_instance = component_inst
			_create_placement_visualizer(component_img)
		else:
			print("false")
	if current_component == 1:
		_place_component(component_instance, cockpit_marker)
		_delete_placement_visualizer()

func _create_placement_visualizer(visual: CompressedTexture2D):
	placer = Sprite2D.new()
	add_child(placer)
	placer.texture = visual
	placer.modulate = Color(255.014, 255.014, 255.014, 0.784)
	
func _delete_placement_visualizer():
	placer.free()
	
func _place_component(comp_inst:PackedScene,position: Vector2):
	if is_instance_valid(comp_inst):
		var place = comp_inst.instantiate()
		place.global_position = position
		owner.add_child(place)
