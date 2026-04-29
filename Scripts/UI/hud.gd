extends CanvasLayer

var selected_component = {"none": 0, "cockpit_1": 1, "cargo_1": 2, "fuel_1": 3, "rocket_1": 4}
var current_component: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventCall.connect("pressed", _button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = "Current Component: " + str(current_component)


				
func _button_pressed(component_num: int):
	for i in selected_component:
		if component_num == selected_component[i]:
			current_component = selected_component[i]
		else:
			print("false")
