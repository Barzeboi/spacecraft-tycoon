extends Area2D


func _on_mouse_entered() -> void:
	EventCall.emit_signal("placement", null, true, global_position)
	print(true)


func _on_mouse_exited() -> void:
	EventCall.emit_signal('placement', null, false, global_position)
	print(false)
