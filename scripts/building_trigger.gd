extends Area2D

@export var roof_layer: TileMapLayer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		_reveal_interior(true)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		_reveal_interior(false)

func _reveal_interior(entering: bool) -> void:
	var tween := create_tween()
	tween.tween_property(roof_layer, "modulate:a", 0.0 if entering else 1.0, 0.3)
