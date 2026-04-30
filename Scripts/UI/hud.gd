extends CanvasLayer

var selected_component = {"none": 0, "cockpit_1": 1, "cargo_1": 2, "fuel_1": 3, "rocket_1": 4}
var current_component: int
var placer
var component_instance: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventCall.connect("pressed", _button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	$Label.text = "Current Component: " + str(current_component)
				
func _button_pressed(component_num: int, component_inst: PackedScene):
	for i in selected_component:
		if component_num == selected_component[i]:
			current_component = selected_component[i]
			component_instance = component_inst
		else:
			print("false")

func _create_placement_visualizer(visual: CompressedTexture2D):
	placer = Sprite2D.new()
	add_child(placer)
	placer.texture = visual
	placer.self_modulate = Color(255.014, 255.014, 255.014, 0.784)
	
func _delete_placement_visualizer():
	placer.free()
	
func _place_component():
	if current_component == 1:
		
