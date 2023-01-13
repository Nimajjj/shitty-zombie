extends Area2D


func take_damage(dmg: float) -> void:
	get_parent().take_damage(dmg)

