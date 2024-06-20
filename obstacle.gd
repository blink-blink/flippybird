extends AnimatableBody3D

signal obstacle_passed

func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	queue_free()


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body != self:
		emit_signal("obstacle_passed")
