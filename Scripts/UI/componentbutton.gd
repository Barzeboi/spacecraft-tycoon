extends Button

@export var component_manager: ComponentManager = ComponentManager.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.icon = component_manager.visual
	self.text = component_manager.name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	EventCall.emit_signal("pressed", component_manager.number, component_manager.component)
