extends CanvasLayer


enum selected_component {
	"none",
	"cockpit_1",
	"cargo_1",
	"fuel_1",
	"rocket_1"
}

var current_component: selected_component = selected_component.none
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventCall.connect("pressed", _button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = "Current Component: " + str(current_component)


				
func _button_pressed(component_name: String):
	for i in selected_component:
		if component_name == i:
			current_component = i
		else:
			print("false")
